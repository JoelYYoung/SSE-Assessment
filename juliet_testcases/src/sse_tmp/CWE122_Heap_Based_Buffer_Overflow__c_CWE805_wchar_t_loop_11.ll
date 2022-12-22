; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_11_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrue(), !dbg !23
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

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_11_good() #0 !dbg !79 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_11_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_11_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* null, i32** %data, align 8, !dbg !106
  %call = call i32 (...) @globalReturnsFalse(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end3, !dbg !112

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !113
  %0 = bitcast i8* %call1 to i32*, !dbg !115
  store i32* %0, i32** %data, align 8, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %cmp = icmp eq i32* %1, null, !dbg !119
  br i1 %cmp, label %if.then2, label %if.end, !dbg !120

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !130
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !131
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx5, align 4, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !137
  %cmp6 = icmp ult i64 %3, 100, !dbg !139
  br i1 %cmp6, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !143
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !143
  %6 = load i32*, i32** %data, align 8, !dbg !144
  %7 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !144
  store i32 %5, i32* %arrayidx8, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %8, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !152
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !152
  store i32 0, i32* %arrayidx9, align 4, !dbg !153
  %10 = load i32*, i32** %data, align 8, !dbg !154
  call void @printWLine(i32* %10), !dbg !155
  %11 = load i32*, i32** %data, align 8, !dbg !156
  %12 = bitcast i32* %11 to i8*, !dbg !156
  call void @free(i8* %12) #5, !dbg !157
  ret void, !dbg !158
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !159 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !160, metadata !DIExpression()), !dbg !161
  store i32* null, i32** %data, align 8, !dbg !162
  %call = call i32 (...) @globalReturnsTrue(), !dbg !163
  %tobool = icmp ne i32 %call, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.end3, !dbg !165

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !166
  %0 = bitcast i8* %call1 to i32*, !dbg !168
  store i32* %0, i32** %data, align 8, !dbg !169
  %1 = load i32*, i32** %data, align 8, !dbg !170
  %cmp = icmp eq i32* %1, null, !dbg !172
  br i1 %cmp, label %if.then2, label %if.end, !dbg !173

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !174
  unreachable, !dbg !174

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !176
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !176
  store i32 0, i32* %arrayidx, align 4, !dbg !177
  br label %if.end3, !dbg !178

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !182, metadata !DIExpression()), !dbg !183
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !184
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !185
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !186
  store i32 0, i32* %arrayidx5, align 4, !dbg !187
  store i64 0, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !191
  %cmp6 = icmp ult i64 %3, 100, !dbg !193
  br i1 %cmp6, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !197
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !197
  %6 = load i32*, i32** %data, align 8, !dbg !198
  %7 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !198
  store i32 %5, i32* %arrayidx8, align 4, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %8, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !206
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !206
  store i32 0, i32* %arrayidx9, align 4, !dbg !207
  %10 = load i32*, i32** %data, align 8, !dbg !208
  call void @printWLine(i32* %10), !dbg !209
  %11 = load i32*, i32** %data, align 8, !dbg !210
  %12 = bitcast i32* %11 to i8*, !dbg !210
  call void @free(i8* %12) #5, !dbg !211
  ret void, !dbg !212
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_11.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_11_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_11.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 14, scope: !27)
!30 = !DILocation(line: 31, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 13)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 13, scope: !27)
!34 = !DILocation(line: 31, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 31, column: 27)
!36 = !DILocation(line: 32, column: 9, scope: !27)
!37 = !DILocation(line: 32, column: 17, scope: !27)
!38 = !DILocation(line: 33, column: 5, scope: !27)
!39 = !DILocalVariable(name: "i", scope: !40, file: !17, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 35, column: 16, scope: !40)
!44 = !DILocalVariable(name: "source", scope: !40, file: !17, line: 36, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 36, column: 17, scope: !40)
!49 = !DILocation(line: 37, column: 17, scope: !40)
!50 = !DILocation(line: 37, column: 9, scope: !40)
!51 = !DILocation(line: 38, column: 9, scope: !40)
!52 = !DILocation(line: 38, column: 23, scope: !40)
!53 = !DILocation(line: 40, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !40, file: !17, line: 40, column: 9)
!55 = !DILocation(line: 40, column: 14, scope: !54)
!56 = !DILocation(line: 40, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !17, line: 40, column: 9)
!58 = !DILocation(line: 40, column: 23, scope: !57)
!59 = !DILocation(line: 40, column: 9, scope: !54)
!60 = !DILocation(line: 42, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !17, line: 41, column: 9)
!62 = !DILocation(line: 42, column: 23, scope: !61)
!63 = !DILocation(line: 42, column: 13, scope: !61)
!64 = !DILocation(line: 42, column: 18, scope: !61)
!65 = !DILocation(line: 42, column: 21, scope: !61)
!66 = !DILocation(line: 43, column: 9, scope: !61)
!67 = !DILocation(line: 40, column: 31, scope: !57)
!68 = !DILocation(line: 40, column: 9, scope: !57)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 43, column: 9, scope: !54)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 44, column: 9, scope: !40)
!73 = !DILocation(line: 44, column: 21, scope: !40)
!74 = !DILocation(line: 45, column: 20, scope: !40)
!75 = !DILocation(line: 45, column: 9, scope: !40)
!76 = !DILocation(line: 46, column: 14, scope: !40)
!77 = !DILocation(line: 46, column: 9, scope: !40)
!78 = !DILocation(line: 48, column: 1, scope: !16)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_11_good", scope: !17, file: !17, line: 115, type: !18, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 117, column: 5, scope: !79)
!81 = !DILocation(line: 118, column: 5, scope: !79)
!82 = !DILocation(line: 119, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 131, type: !84, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!7, !7, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !17, line: 131, type: !7)
!90 = !DILocation(line: 131, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !17, line: 131, type: !86)
!92 = !DILocation(line: 131, column: 27, scope: !83)
!93 = !DILocation(line: 134, column: 22, scope: !83)
!94 = !DILocation(line: 134, column: 12, scope: !83)
!95 = !DILocation(line: 134, column: 5, scope: !83)
!96 = !DILocation(line: 136, column: 5, scope: !83)
!97 = !DILocation(line: 137, column: 5, scope: !83)
!98 = !DILocation(line: 138, column: 5, scope: !83)
!99 = !DILocation(line: 141, column: 5, scope: !83)
!100 = !DILocation(line: 142, column: 5, scope: !83)
!101 = !DILocation(line: 143, column: 5, scope: !83)
!102 = !DILocation(line: 145, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !17, line: 57, type: !4)
!105 = !DILocation(line: 57, column: 15, scope: !103)
!106 = !DILocation(line: 58, column: 10, scope: !103)
!107 = !DILocation(line: 59, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !17, line: 59, column: 8)
!109 = !DILocation(line: 59, column: 8, scope: !103)
!110 = !DILocation(line: 62, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !17, line: 60, column: 5)
!112 = !DILocation(line: 63, column: 5, scope: !111)
!113 = !DILocation(line: 67, column: 27, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !17, line: 65, column: 5)
!115 = !DILocation(line: 67, column: 16, scope: !114)
!116 = !DILocation(line: 67, column: 14, scope: !114)
!117 = !DILocation(line: 68, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !17, line: 68, column: 13)
!119 = !DILocation(line: 68, column: 18, scope: !118)
!120 = !DILocation(line: 68, column: 13, scope: !114)
!121 = !DILocation(line: 68, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !17, line: 68, column: 27)
!123 = !DILocation(line: 69, column: 9, scope: !114)
!124 = !DILocation(line: 69, column: 17, scope: !114)
!125 = !DILocalVariable(name: "i", scope: !126, file: !17, line: 72, type: !41)
!126 = distinct !DILexicalBlock(scope: !103, file: !17, line: 71, column: 5)
!127 = !DILocation(line: 72, column: 16, scope: !126)
!128 = !DILocalVariable(name: "source", scope: !126, file: !17, line: 73, type: !45)
!129 = !DILocation(line: 73, column: 17, scope: !126)
!130 = !DILocation(line: 74, column: 17, scope: !126)
!131 = !DILocation(line: 74, column: 9, scope: !126)
!132 = !DILocation(line: 75, column: 9, scope: !126)
!133 = !DILocation(line: 75, column: 23, scope: !126)
!134 = !DILocation(line: 77, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !126, file: !17, line: 77, column: 9)
!136 = !DILocation(line: 77, column: 14, scope: !135)
!137 = !DILocation(line: 77, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !17, line: 77, column: 9)
!139 = !DILocation(line: 77, column: 23, scope: !138)
!140 = !DILocation(line: 77, column: 9, scope: !135)
!141 = !DILocation(line: 79, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !17, line: 78, column: 9)
!143 = !DILocation(line: 79, column: 23, scope: !142)
!144 = !DILocation(line: 79, column: 13, scope: !142)
!145 = !DILocation(line: 79, column: 18, scope: !142)
!146 = !DILocation(line: 79, column: 21, scope: !142)
!147 = !DILocation(line: 80, column: 9, scope: !142)
!148 = !DILocation(line: 77, column: 31, scope: !138)
!149 = !DILocation(line: 77, column: 9, scope: !138)
!150 = distinct !{!150, !140, !151, !71}
!151 = !DILocation(line: 80, column: 9, scope: !135)
!152 = !DILocation(line: 81, column: 9, scope: !126)
!153 = !DILocation(line: 81, column: 21, scope: !126)
!154 = !DILocation(line: 82, column: 20, scope: !126)
!155 = !DILocation(line: 82, column: 9, scope: !126)
!156 = !DILocation(line: 83, column: 14, scope: !126)
!157 = !DILocation(line: 83, column: 9, scope: !126)
!158 = !DILocation(line: 85, column: 1, scope: !103)
!159 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!160 = !DILocalVariable(name: "data", scope: !159, file: !17, line: 90, type: !4)
!161 = !DILocation(line: 90, column: 15, scope: !159)
!162 = !DILocation(line: 91, column: 10, scope: !159)
!163 = !DILocation(line: 92, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !17, line: 92, column: 8)
!165 = !DILocation(line: 92, column: 8, scope: !159)
!166 = !DILocation(line: 95, column: 27, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !17, line: 93, column: 5)
!168 = !DILocation(line: 95, column: 16, scope: !167)
!169 = !DILocation(line: 95, column: 14, scope: !167)
!170 = !DILocation(line: 96, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !17, line: 96, column: 13)
!172 = !DILocation(line: 96, column: 18, scope: !171)
!173 = !DILocation(line: 96, column: 13, scope: !167)
!174 = !DILocation(line: 96, column: 28, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !17, line: 96, column: 27)
!176 = !DILocation(line: 97, column: 9, scope: !167)
!177 = !DILocation(line: 97, column: 17, scope: !167)
!178 = !DILocation(line: 98, column: 5, scope: !167)
!179 = !DILocalVariable(name: "i", scope: !180, file: !17, line: 100, type: !41)
!180 = distinct !DILexicalBlock(scope: !159, file: !17, line: 99, column: 5)
!181 = !DILocation(line: 100, column: 16, scope: !180)
!182 = !DILocalVariable(name: "source", scope: !180, file: !17, line: 101, type: !45)
!183 = !DILocation(line: 101, column: 17, scope: !180)
!184 = !DILocation(line: 102, column: 17, scope: !180)
!185 = !DILocation(line: 102, column: 9, scope: !180)
!186 = !DILocation(line: 103, column: 9, scope: !180)
!187 = !DILocation(line: 103, column: 23, scope: !180)
!188 = !DILocation(line: 105, column: 16, scope: !189)
!189 = distinct !DILexicalBlock(scope: !180, file: !17, line: 105, column: 9)
!190 = !DILocation(line: 105, column: 14, scope: !189)
!191 = !DILocation(line: 105, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !17, line: 105, column: 9)
!193 = !DILocation(line: 105, column: 23, scope: !192)
!194 = !DILocation(line: 105, column: 9, scope: !189)
!195 = !DILocation(line: 107, column: 30, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !17, line: 106, column: 9)
!197 = !DILocation(line: 107, column: 23, scope: !196)
!198 = !DILocation(line: 107, column: 13, scope: !196)
!199 = !DILocation(line: 107, column: 18, scope: !196)
!200 = !DILocation(line: 107, column: 21, scope: !196)
!201 = !DILocation(line: 108, column: 9, scope: !196)
!202 = !DILocation(line: 105, column: 31, scope: !192)
!203 = !DILocation(line: 105, column: 9, scope: !192)
!204 = distinct !{!204, !194, !205, !71}
!205 = !DILocation(line: 108, column: 9, scope: !189)
!206 = !DILocation(line: 109, column: 9, scope: !180)
!207 = !DILocation(line: 109, column: 21, scope: !180)
!208 = !DILocation(line: 110, column: 20, scope: !180)
!209 = !DILocation(line: 110, column: 9, scope: !180)
!210 = !DILocation(line: 111, column: 14, scope: !180)
!211 = !DILocation(line: 111, column: 9, scope: !180)
!212 = !DILocation(line: 113, column: 1, scope: !159)
