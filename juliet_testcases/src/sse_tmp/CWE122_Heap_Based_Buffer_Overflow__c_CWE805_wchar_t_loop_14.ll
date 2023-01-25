; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_14_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @globalFive, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end3, !dbg !26

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !27
  %1 = bitcast i8* %call to i32*, !dbg !29
  store i32* %1, i32** %data, align 8, !dbg !30
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %cmp1 = icmp eq i32* %2, null, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !34

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end3, !dbg !39

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !51
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx5, align 4, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !57
  %cmp6 = icmp ult i64 %4, 100, !dbg !59
  br i1 %cmp6, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !63
  %6 = load i32, i32* %arrayidx7, align 4, !dbg !63
  %7 = load i32*, i32** %data, align 8, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !64
  store i32 %6, i32* %arrayidx8, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %9, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !73
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !73
  store i32 0, i32* %arrayidx9, align 4, !dbg !74
  %11 = load i32*, i32** %data, align 8, !dbg !75
  call void @printWLine(i32* %11), !dbg !76
  %12 = load i32*, i32** %data, align 8, !dbg !77
  %13 = bitcast i32* %12 to i8*, !dbg !77
  call void @free(i8* %13) #5, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_14_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_14_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_14_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i32* null, i32** %data, align 8, !dbg !107
  %0 = load i32, i32* @globalFive, align 4, !dbg !108
  %cmp = icmp ne i32 %0, 5, !dbg !110
  br i1 %cmp, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end3, !dbg !114

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !115
  %1 = bitcast i8* %call to i32*, !dbg !117
  store i32* %1, i32** %data, align 8, !dbg !118
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %cmp1 = icmp eq i32* %2, null, !dbg !121
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !122

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !132
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !133
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx5, align 4, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !139
  %cmp6 = icmp ult i64 %4, 100, !dbg !141
  br i1 %cmp6, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !145
  %6 = load i32, i32* %arrayidx7, align 4, !dbg !145
  %7 = load i32*, i32** %data, align 8, !dbg !146
  %8 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !146
  store i32 %6, i32* %arrayidx8, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %9, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !154
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !154
  store i32 0, i32* %arrayidx9, align 4, !dbg !155
  %11 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* %11), !dbg !157
  %12 = load i32*, i32** %data, align 8, !dbg !158
  %13 = bitcast i32* %12 to i8*, !dbg !158
  call void @free(i8* %13) #5, !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !161 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !162, metadata !DIExpression()), !dbg !163
  store i32* null, i32** %data, align 8, !dbg !164
  %0 = load i32, i32* @globalFive, align 4, !dbg !165
  %cmp = icmp eq i32 %0, 5, !dbg !167
  br i1 %cmp, label %if.then, label %if.end3, !dbg !168

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !169
  %1 = bitcast i8* %call to i32*, !dbg !171
  store i32* %1, i32** %data, align 8, !dbg !172
  %2 = load i32*, i32** %data, align 8, !dbg !173
  %cmp1 = icmp eq i32* %2, null, !dbg !175
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !176

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !177
  unreachable, !dbg !177

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !179
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !179
  store i32 0, i32* %arrayidx, align 4, !dbg !180
  br label %if.end3, !dbg !181

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !182, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !185, metadata !DIExpression()), !dbg !186
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !187
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !188
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !189
  store i32 0, i32* %arrayidx5, align 4, !dbg !190
  store i64 0, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !194
  %cmp6 = icmp ult i64 %4, 100, !dbg !196
  br i1 %cmp6, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !198
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !200
  %6 = load i32, i32* %arrayidx7, align 4, !dbg !200
  %7 = load i32*, i32** %data, align 8, !dbg !201
  %8 = load i64, i64* %i, align 8, !dbg !202
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !201
  store i32 %6, i32* %arrayidx8, align 4, !dbg !203
  br label %for.inc, !dbg !204

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !205
  %inc = add i64 %9, 1, !dbg !205
  store i64 %inc, i64* %i, align 8, !dbg !205
  br label %for.cond, !dbg !206, !llvm.loop !207

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !209
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !209
  store i32 0, i32* %arrayidx9, align 4, !dbg !210
  %11 = load i32*, i32** %data, align 8, !dbg !211
  call void @printWLine(i32* %11), !dbg !212
  %12 = load i32*, i32** %data, align 8, !dbg !213
  %13 = bitcast i32* %12 to i8*, !dbg !213
  call void @free(i8* %13) #5, !dbg !214
  ret void, !dbg !215
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_14_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 18, scope: !24)
!26 = !DILocation(line: 27, column: 8, scope: !16)
!27 = !DILocation(line: 30, column: 27, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!29 = !DILocation(line: 30, column: 16, scope: !28)
!30 = !DILocation(line: 30, column: 14, scope: !28)
!31 = !DILocation(line: 31, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 31, column: 13)
!33 = !DILocation(line: 31, column: 18, scope: !32)
!34 = !DILocation(line: 31, column: 13, scope: !28)
!35 = !DILocation(line: 31, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 31, column: 27)
!37 = !DILocation(line: 32, column: 9, scope: !28)
!38 = !DILocation(line: 32, column: 17, scope: !28)
!39 = !DILocation(line: 33, column: 5, scope: !28)
!40 = !DILocalVariable(name: "i", scope: !41, file: !17, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 35, column: 16, scope: !41)
!45 = !DILocalVariable(name: "source", scope: !41, file: !17, line: 36, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 36, column: 17, scope: !41)
!50 = !DILocation(line: 37, column: 17, scope: !41)
!51 = !DILocation(line: 37, column: 9, scope: !41)
!52 = !DILocation(line: 38, column: 9, scope: !41)
!53 = !DILocation(line: 38, column: 23, scope: !41)
!54 = !DILocation(line: 40, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !41, file: !17, line: 40, column: 9)
!56 = !DILocation(line: 40, column: 14, scope: !55)
!57 = !DILocation(line: 40, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !17, line: 40, column: 9)
!59 = !DILocation(line: 40, column: 23, scope: !58)
!60 = !DILocation(line: 40, column: 9, scope: !55)
!61 = !DILocation(line: 42, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !17, line: 41, column: 9)
!63 = !DILocation(line: 42, column: 23, scope: !62)
!64 = !DILocation(line: 42, column: 13, scope: !62)
!65 = !DILocation(line: 42, column: 18, scope: !62)
!66 = !DILocation(line: 42, column: 21, scope: !62)
!67 = !DILocation(line: 43, column: 9, scope: !62)
!68 = !DILocation(line: 40, column: 31, scope: !58)
!69 = !DILocation(line: 40, column: 9, scope: !58)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 43, column: 9, scope: !55)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 44, column: 9, scope: !41)
!74 = !DILocation(line: 44, column: 21, scope: !41)
!75 = !DILocation(line: 45, column: 20, scope: !41)
!76 = !DILocation(line: 45, column: 9, scope: !41)
!77 = !DILocation(line: 46, column: 14, scope: !41)
!78 = !DILocation(line: 46, column: 9, scope: !41)
!79 = !DILocation(line: 48, column: 1, scope: !16)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_14_good", scope: !17, file: !17, line: 115, type: !18, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 117, column: 5, scope: !80)
!82 = !DILocation(line: 118, column: 5, scope: !80)
!83 = !DILocation(line: 119, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 131, type: !85, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!7, !7, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !17, line: 131, type: !7)
!91 = !DILocation(line: 131, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !17, line: 131, type: !87)
!93 = !DILocation(line: 131, column: 27, scope: !84)
!94 = !DILocation(line: 134, column: 22, scope: !84)
!95 = !DILocation(line: 134, column: 12, scope: !84)
!96 = !DILocation(line: 134, column: 5, scope: !84)
!97 = !DILocation(line: 136, column: 5, scope: !84)
!98 = !DILocation(line: 137, column: 5, scope: !84)
!99 = !DILocation(line: 138, column: 5, scope: !84)
!100 = !DILocation(line: 141, column: 5, scope: !84)
!101 = !DILocation(line: 142, column: 5, scope: !84)
!102 = !DILocation(line: 143, column: 5, scope: !84)
!103 = !DILocation(line: 145, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !17, line: 57, type: !4)
!106 = !DILocation(line: 57, column: 15, scope: !104)
!107 = !DILocation(line: 58, column: 10, scope: !104)
!108 = !DILocation(line: 59, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !17, line: 59, column: 8)
!110 = !DILocation(line: 59, column: 18, scope: !109)
!111 = !DILocation(line: 59, column: 8, scope: !104)
!112 = !DILocation(line: 62, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !17, line: 60, column: 5)
!114 = !DILocation(line: 63, column: 5, scope: !113)
!115 = !DILocation(line: 67, column: 27, scope: !116)
!116 = distinct !DILexicalBlock(scope: !109, file: !17, line: 65, column: 5)
!117 = !DILocation(line: 67, column: 16, scope: !116)
!118 = !DILocation(line: 67, column: 14, scope: !116)
!119 = !DILocation(line: 68, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !17, line: 68, column: 13)
!121 = !DILocation(line: 68, column: 18, scope: !120)
!122 = !DILocation(line: 68, column: 13, scope: !116)
!123 = !DILocation(line: 68, column: 28, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !17, line: 68, column: 27)
!125 = !DILocation(line: 69, column: 9, scope: !116)
!126 = !DILocation(line: 69, column: 17, scope: !116)
!127 = !DILocalVariable(name: "i", scope: !128, file: !17, line: 72, type: !42)
!128 = distinct !DILexicalBlock(scope: !104, file: !17, line: 71, column: 5)
!129 = !DILocation(line: 72, column: 16, scope: !128)
!130 = !DILocalVariable(name: "source", scope: !128, file: !17, line: 73, type: !46)
!131 = !DILocation(line: 73, column: 17, scope: !128)
!132 = !DILocation(line: 74, column: 17, scope: !128)
!133 = !DILocation(line: 74, column: 9, scope: !128)
!134 = !DILocation(line: 75, column: 9, scope: !128)
!135 = !DILocation(line: 75, column: 23, scope: !128)
!136 = !DILocation(line: 77, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !128, file: !17, line: 77, column: 9)
!138 = !DILocation(line: 77, column: 14, scope: !137)
!139 = !DILocation(line: 77, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !17, line: 77, column: 9)
!141 = !DILocation(line: 77, column: 23, scope: !140)
!142 = !DILocation(line: 77, column: 9, scope: !137)
!143 = !DILocation(line: 79, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !17, line: 78, column: 9)
!145 = !DILocation(line: 79, column: 23, scope: !144)
!146 = !DILocation(line: 79, column: 13, scope: !144)
!147 = !DILocation(line: 79, column: 18, scope: !144)
!148 = !DILocation(line: 79, column: 21, scope: !144)
!149 = !DILocation(line: 80, column: 9, scope: !144)
!150 = !DILocation(line: 77, column: 31, scope: !140)
!151 = !DILocation(line: 77, column: 9, scope: !140)
!152 = distinct !{!152, !142, !153, !72}
!153 = !DILocation(line: 80, column: 9, scope: !137)
!154 = !DILocation(line: 81, column: 9, scope: !128)
!155 = !DILocation(line: 81, column: 21, scope: !128)
!156 = !DILocation(line: 82, column: 20, scope: !128)
!157 = !DILocation(line: 82, column: 9, scope: !128)
!158 = !DILocation(line: 83, column: 14, scope: !128)
!159 = !DILocation(line: 83, column: 9, scope: !128)
!160 = !DILocation(line: 85, column: 1, scope: !104)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DILocalVariable(name: "data", scope: !161, file: !17, line: 90, type: !4)
!163 = !DILocation(line: 90, column: 15, scope: !161)
!164 = !DILocation(line: 91, column: 10, scope: !161)
!165 = !DILocation(line: 92, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !17, line: 92, column: 8)
!167 = !DILocation(line: 92, column: 18, scope: !166)
!168 = !DILocation(line: 92, column: 8, scope: !161)
!169 = !DILocation(line: 95, column: 27, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !17, line: 93, column: 5)
!171 = !DILocation(line: 95, column: 16, scope: !170)
!172 = !DILocation(line: 95, column: 14, scope: !170)
!173 = !DILocation(line: 96, column: 13, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !17, line: 96, column: 13)
!175 = !DILocation(line: 96, column: 18, scope: !174)
!176 = !DILocation(line: 96, column: 13, scope: !170)
!177 = !DILocation(line: 96, column: 28, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !17, line: 96, column: 27)
!179 = !DILocation(line: 97, column: 9, scope: !170)
!180 = !DILocation(line: 97, column: 17, scope: !170)
!181 = !DILocation(line: 98, column: 5, scope: !170)
!182 = !DILocalVariable(name: "i", scope: !183, file: !17, line: 100, type: !42)
!183 = distinct !DILexicalBlock(scope: !161, file: !17, line: 99, column: 5)
!184 = !DILocation(line: 100, column: 16, scope: !183)
!185 = !DILocalVariable(name: "source", scope: !183, file: !17, line: 101, type: !46)
!186 = !DILocation(line: 101, column: 17, scope: !183)
!187 = !DILocation(line: 102, column: 17, scope: !183)
!188 = !DILocation(line: 102, column: 9, scope: !183)
!189 = !DILocation(line: 103, column: 9, scope: !183)
!190 = !DILocation(line: 103, column: 23, scope: !183)
!191 = !DILocation(line: 105, column: 16, scope: !192)
!192 = distinct !DILexicalBlock(scope: !183, file: !17, line: 105, column: 9)
!193 = !DILocation(line: 105, column: 14, scope: !192)
!194 = !DILocation(line: 105, column: 21, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !17, line: 105, column: 9)
!196 = !DILocation(line: 105, column: 23, scope: !195)
!197 = !DILocation(line: 105, column: 9, scope: !192)
!198 = !DILocation(line: 107, column: 30, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !17, line: 106, column: 9)
!200 = !DILocation(line: 107, column: 23, scope: !199)
!201 = !DILocation(line: 107, column: 13, scope: !199)
!202 = !DILocation(line: 107, column: 18, scope: !199)
!203 = !DILocation(line: 107, column: 21, scope: !199)
!204 = !DILocation(line: 108, column: 9, scope: !199)
!205 = !DILocation(line: 105, column: 31, scope: !195)
!206 = !DILocation(line: 105, column: 9, scope: !195)
!207 = distinct !{!207, !197, !208, !72}
!208 = !DILocation(line: 108, column: 9, scope: !192)
!209 = !DILocation(line: 109, column: 9, scope: !183)
!210 = !DILocation(line: 109, column: 21, scope: !183)
!211 = !DILocation(line: 110, column: 20, scope: !183)
!212 = !DILocation(line: 110, column: 9, scope: !183)
!213 = !DILocation(line: 111, column: 14, scope: !183)
!214 = !DILocation(line: 111, column: 9, scope: !183)
!215 = !DILocation(line: 113, column: 1, scope: !161)
