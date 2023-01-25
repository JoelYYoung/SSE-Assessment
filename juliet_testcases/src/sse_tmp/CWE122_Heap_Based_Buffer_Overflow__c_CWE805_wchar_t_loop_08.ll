; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !50
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx5, align 4, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !56
  %cmp6 = icmp ult i64 %3, 100, !dbg !58
  br i1 %cmp6, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !62
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !62
  %6 = load i32*, i32** %data, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !63
  store i32 %5, i32* %arrayidx8, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %8, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !72
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !72
  store i32 0, i32* %arrayidx9, align 4, !dbg !73
  %10 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* %10), !dbg !75
  %11 = load i32*, i32** %data, align 8, !dbg !76
  %12 = bitcast i32* %11 to i8*, !dbg !76
  call void @free(i8* %12) #5, !dbg !77
  ret void, !dbg !78
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_08_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #5, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #5, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_08_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_08_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !103 {
entry:
  ret i32 1, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i32* null, i32** %data, align 8, !dbg !110
  %call = call i32 @staticReturnsFalse(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end3, !dbg !116

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !117
  %0 = bitcast i8* %call1 to i32*, !dbg !119
  store i32* %0, i32** %data, align 8, !dbg !120
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %cmp = icmp eq i32* %1, null, !dbg !123
  br i1 %cmp, label %if.then2, label %if.end, !dbg !124

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !134
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !135
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx5, align 4, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !141
  %cmp6 = icmp ult i64 %3, 100, !dbg !143
  br i1 %cmp6, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !147
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !147
  %6 = load i32*, i32** %data, align 8, !dbg !148
  %7 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !148
  store i32 %5, i32* %arrayidx8, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %8, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !156
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !156
  store i32 0, i32* %arrayidx9, align 4, !dbg !157
  %10 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* %10), !dbg !159
  %11 = load i32*, i32** %data, align 8, !dbg !160
  %12 = bitcast i32* %11 to i8*, !dbg !160
  call void @free(i8* %12) #5, !dbg !161
  ret void, !dbg !162
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !163 {
entry:
  ret i32 0, !dbg !164
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !165 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !166, metadata !DIExpression()), !dbg !167
  store i32* null, i32** %data, align 8, !dbg !168
  %call = call i32 @staticReturnsTrue(), !dbg !169
  %tobool = icmp ne i32 %call, 0, !dbg !169
  br i1 %tobool, label %if.then, label %if.end3, !dbg !171

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !172
  %0 = bitcast i8* %call1 to i32*, !dbg !174
  store i32* %0, i32** %data, align 8, !dbg !175
  %1 = load i32*, i32** %data, align 8, !dbg !176
  %cmp = icmp eq i32* %1, null, !dbg !178
  br i1 %cmp, label %if.then2, label %if.end, !dbg !179

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !180
  unreachable, !dbg !180

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !182
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !182
  store i32 0, i32* %arrayidx, align 4, !dbg !183
  br label %if.end3, !dbg !184

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !185, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !188, metadata !DIExpression()), !dbg !189
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !190
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !191
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !192
  store i32 0, i32* %arrayidx5, align 4, !dbg !193
  store i64 0, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !197
  %cmp6 = icmp ult i64 %3, 100, !dbg !199
  br i1 %cmp6, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !203
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !203
  %6 = load i32*, i32** %data, align 8, !dbg !204
  %7 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !204
  store i32 %5, i32* %arrayidx8, align 4, !dbg !206
  br label %for.inc, !dbg !207

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !208
  %inc = add i64 %8, 1, !dbg !208
  store i64 %inc, i64* %i, align 8, !dbg !208
  br label %for.cond, !dbg !209, !llvm.loop !210

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !212
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !212
  store i32 0, i32* %arrayidx9, align 4, !dbg !213
  %10 = load i32*, i32** %data, align 8, !dbg !214
  call void @printWLine(i32* %10), !dbg !215
  %11 = load i32*, i32** %data, align 8, !dbg !216
  %12 = bitcast i32* %11 to i8*, !dbg !216
  call void @free(i8* %12) #5, !dbg !217
  ret void, !dbg !218
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 10, scope: !16)
!23 = !DILocation(line: 41, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 8)
!25 = !DILocation(line: 41, column: 8, scope: !16)
!26 = !DILocation(line: 44, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 42, column: 5)
!28 = !DILocation(line: 44, column: 16, scope: !27)
!29 = !DILocation(line: 44, column: 14, scope: !27)
!30 = !DILocation(line: 45, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 45, column: 13)
!32 = !DILocation(line: 45, column: 18, scope: !31)
!33 = !DILocation(line: 45, column: 13, scope: !27)
!34 = !DILocation(line: 45, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 45, column: 27)
!36 = !DILocation(line: 46, column: 9, scope: !27)
!37 = !DILocation(line: 46, column: 17, scope: !27)
!38 = !DILocation(line: 47, column: 5, scope: !27)
!39 = !DILocalVariable(name: "i", scope: !40, file: !17, line: 49, type: !41)
!40 = distinct !DILexicalBlock(scope: !16, file: !17, line: 48, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 49, column: 16, scope: !40)
!44 = !DILocalVariable(name: "source", scope: !40, file: !17, line: 50, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 50, column: 17, scope: !40)
!49 = !DILocation(line: 51, column: 17, scope: !40)
!50 = !DILocation(line: 51, column: 9, scope: !40)
!51 = !DILocation(line: 52, column: 9, scope: !40)
!52 = !DILocation(line: 52, column: 23, scope: !40)
!53 = !DILocation(line: 54, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !40, file: !17, line: 54, column: 9)
!55 = !DILocation(line: 54, column: 14, scope: !54)
!56 = !DILocation(line: 54, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !17, line: 54, column: 9)
!58 = !DILocation(line: 54, column: 23, scope: !57)
!59 = !DILocation(line: 54, column: 9, scope: !54)
!60 = !DILocation(line: 56, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !17, line: 55, column: 9)
!62 = !DILocation(line: 56, column: 23, scope: !61)
!63 = !DILocation(line: 56, column: 13, scope: !61)
!64 = !DILocation(line: 56, column: 18, scope: !61)
!65 = !DILocation(line: 56, column: 21, scope: !61)
!66 = !DILocation(line: 57, column: 9, scope: !61)
!67 = !DILocation(line: 54, column: 31, scope: !57)
!68 = !DILocation(line: 54, column: 9, scope: !57)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 57, column: 9, scope: !54)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 58, column: 9, scope: !40)
!73 = !DILocation(line: 58, column: 21, scope: !40)
!74 = !DILocation(line: 59, column: 20, scope: !40)
!75 = !DILocation(line: 59, column: 9, scope: !40)
!76 = !DILocation(line: 60, column: 14, scope: !40)
!77 = !DILocation(line: 60, column: 9, scope: !40)
!78 = !DILocation(line: 62, column: 1, scope: !16)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_08_good", scope: !17, file: !17, line: 129, type: !18, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 131, column: 5, scope: !79)
!81 = !DILocation(line: 132, column: 5, scope: !79)
!82 = !DILocation(line: 133, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 145, type: !84, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!7, !7, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !17, line: 145, type: !7)
!90 = !DILocation(line: 145, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !17, line: 145, type: !86)
!92 = !DILocation(line: 145, column: 27, scope: !83)
!93 = !DILocation(line: 148, column: 22, scope: !83)
!94 = !DILocation(line: 148, column: 12, scope: !83)
!95 = !DILocation(line: 148, column: 5, scope: !83)
!96 = !DILocation(line: 150, column: 5, scope: !83)
!97 = !DILocation(line: 151, column: 5, scope: !83)
!98 = !DILocation(line: 152, column: 5, scope: !83)
!99 = !DILocation(line: 155, column: 5, scope: !83)
!100 = !DILocation(line: 156, column: 5, scope: !83)
!101 = !DILocation(line: 157, column: 5, scope: !83)
!102 = !DILocation(line: 159, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !104, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{!7}
!106 = !DILocation(line: 27, column: 5, scope: !103)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 69, type: !18, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !17, line: 71, type: !4)
!109 = !DILocation(line: 71, column: 15, scope: !107)
!110 = !DILocation(line: 72, column: 10, scope: !107)
!111 = !DILocation(line: 73, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !17, line: 73, column: 8)
!113 = !DILocation(line: 73, column: 8, scope: !107)
!114 = !DILocation(line: 76, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !17, line: 74, column: 5)
!116 = !DILocation(line: 77, column: 5, scope: !115)
!117 = !DILocation(line: 81, column: 27, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !17, line: 79, column: 5)
!119 = !DILocation(line: 81, column: 16, scope: !118)
!120 = !DILocation(line: 81, column: 14, scope: !118)
!121 = !DILocation(line: 82, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !17, line: 82, column: 13)
!123 = !DILocation(line: 82, column: 18, scope: !122)
!124 = !DILocation(line: 82, column: 13, scope: !118)
!125 = !DILocation(line: 82, column: 28, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !17, line: 82, column: 27)
!127 = !DILocation(line: 83, column: 9, scope: !118)
!128 = !DILocation(line: 83, column: 17, scope: !118)
!129 = !DILocalVariable(name: "i", scope: !130, file: !17, line: 86, type: !41)
!130 = distinct !DILexicalBlock(scope: !107, file: !17, line: 85, column: 5)
!131 = !DILocation(line: 86, column: 16, scope: !130)
!132 = !DILocalVariable(name: "source", scope: !130, file: !17, line: 87, type: !45)
!133 = !DILocation(line: 87, column: 17, scope: !130)
!134 = !DILocation(line: 88, column: 17, scope: !130)
!135 = !DILocation(line: 88, column: 9, scope: !130)
!136 = !DILocation(line: 89, column: 9, scope: !130)
!137 = !DILocation(line: 89, column: 23, scope: !130)
!138 = !DILocation(line: 91, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !130, file: !17, line: 91, column: 9)
!140 = !DILocation(line: 91, column: 14, scope: !139)
!141 = !DILocation(line: 91, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !17, line: 91, column: 9)
!143 = !DILocation(line: 91, column: 23, scope: !142)
!144 = !DILocation(line: 91, column: 9, scope: !139)
!145 = !DILocation(line: 93, column: 30, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !17, line: 92, column: 9)
!147 = !DILocation(line: 93, column: 23, scope: !146)
!148 = !DILocation(line: 93, column: 13, scope: !146)
!149 = !DILocation(line: 93, column: 18, scope: !146)
!150 = !DILocation(line: 93, column: 21, scope: !146)
!151 = !DILocation(line: 94, column: 9, scope: !146)
!152 = !DILocation(line: 91, column: 31, scope: !142)
!153 = !DILocation(line: 91, column: 9, scope: !142)
!154 = distinct !{!154, !144, !155, !71}
!155 = !DILocation(line: 94, column: 9, scope: !139)
!156 = !DILocation(line: 95, column: 9, scope: !130)
!157 = !DILocation(line: 95, column: 21, scope: !130)
!158 = !DILocation(line: 96, column: 20, scope: !130)
!159 = !DILocation(line: 96, column: 9, scope: !130)
!160 = !DILocation(line: 97, column: 14, scope: !130)
!161 = !DILocation(line: 97, column: 9, scope: !130)
!162 = !DILocation(line: 99, column: 1, scope: !107)
!163 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !104, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!164 = !DILocation(line: 32, column: 5, scope: !163)
!165 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 102, type: !18, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!166 = !DILocalVariable(name: "data", scope: !165, file: !17, line: 104, type: !4)
!167 = !DILocation(line: 104, column: 15, scope: !165)
!168 = !DILocation(line: 105, column: 10, scope: !165)
!169 = !DILocation(line: 106, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !165, file: !17, line: 106, column: 8)
!171 = !DILocation(line: 106, column: 8, scope: !165)
!172 = !DILocation(line: 109, column: 27, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !17, line: 107, column: 5)
!174 = !DILocation(line: 109, column: 16, scope: !173)
!175 = !DILocation(line: 109, column: 14, scope: !173)
!176 = !DILocation(line: 110, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !17, line: 110, column: 13)
!178 = !DILocation(line: 110, column: 18, scope: !177)
!179 = !DILocation(line: 110, column: 13, scope: !173)
!180 = !DILocation(line: 110, column: 28, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !17, line: 110, column: 27)
!182 = !DILocation(line: 111, column: 9, scope: !173)
!183 = !DILocation(line: 111, column: 17, scope: !173)
!184 = !DILocation(line: 112, column: 5, scope: !173)
!185 = !DILocalVariable(name: "i", scope: !186, file: !17, line: 114, type: !41)
!186 = distinct !DILexicalBlock(scope: !165, file: !17, line: 113, column: 5)
!187 = !DILocation(line: 114, column: 16, scope: !186)
!188 = !DILocalVariable(name: "source", scope: !186, file: !17, line: 115, type: !45)
!189 = !DILocation(line: 115, column: 17, scope: !186)
!190 = !DILocation(line: 116, column: 17, scope: !186)
!191 = !DILocation(line: 116, column: 9, scope: !186)
!192 = !DILocation(line: 117, column: 9, scope: !186)
!193 = !DILocation(line: 117, column: 23, scope: !186)
!194 = !DILocation(line: 119, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !186, file: !17, line: 119, column: 9)
!196 = !DILocation(line: 119, column: 14, scope: !195)
!197 = !DILocation(line: 119, column: 21, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !17, line: 119, column: 9)
!199 = !DILocation(line: 119, column: 23, scope: !198)
!200 = !DILocation(line: 119, column: 9, scope: !195)
!201 = !DILocation(line: 121, column: 30, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !17, line: 120, column: 9)
!203 = !DILocation(line: 121, column: 23, scope: !202)
!204 = !DILocation(line: 121, column: 13, scope: !202)
!205 = !DILocation(line: 121, column: 18, scope: !202)
!206 = !DILocation(line: 121, column: 21, scope: !202)
!207 = !DILocation(line: 122, column: 9, scope: !202)
!208 = !DILocation(line: 119, column: 31, scope: !198)
!209 = !DILocation(line: 119, column: 9, scope: !198)
!210 = distinct !{!210, !200, !211, !71}
!211 = !DILocation(line: 122, column: 9, scope: !195)
!212 = !DILocation(line: 123, column: 9, scope: !186)
!213 = !DILocation(line: 123, column: 21, scope: !186)
!214 = !DILocation(line: 124, column: 20, scope: !186)
!215 = !DILocation(line: 124, column: 9, scope: !186)
!216 = !DILocation(line: 125, column: 14, scope: !186)
!217 = !DILocation(line: 125, column: 9, scope: !186)
!218 = !DILocation(line: 127, column: 1, scope: !165)
