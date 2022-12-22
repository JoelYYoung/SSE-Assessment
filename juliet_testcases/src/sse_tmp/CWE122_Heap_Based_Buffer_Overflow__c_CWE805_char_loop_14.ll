; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %cmp1 = icmp eq i8* %1, null, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx4, align 1, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !54
  %cmp5 = icmp ult i64 %3, 100, !dbg !56
  br i1 %cmp5, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !60
  %5 = load i8, i8* %arrayidx6, align 1, !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !61
  store i8 %5, i8* %arrayidx7, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !70
  %arrayidx8 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !70
  store i8 0, i8* %arrayidx8, align 1, !dbg !71
  %10 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %10), !dbg !73
  %11 = load i8*, i8** %data, align 8, !dbg !74
  call void @free(i8* %11) #6, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_14_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #6, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #6, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_14_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_14_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i8* null, i8** %data, align 8, !dbg !103
  %0 = load i32, i32* @globalFive, align 4, !dbg !104
  %cmp = icmp ne i32 %0, 5, !dbg !106
  br i1 %cmp, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  br label %if.end3, !dbg !110

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !111
  store i8* %call, i8** %data, align 8, !dbg !113
  %1 = load i8*, i8** %data, align 8, !dbg !114
  %cmp1 = icmp eq i8* %1, null, !dbg !116
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !117

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx4, align 1, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !133
  %cmp5 = icmp ult i64 %3, 100, !dbg !135
  br i1 %cmp5, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !139
  %5 = load i8, i8* %arrayidx6, align 1, !dbg !139
  %6 = load i8*, i8** %data, align 8, !dbg !140
  %7 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !140
  store i8 %5, i8* %arrayidx7, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %8, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !148
  %arrayidx8 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !148
  store i8 0, i8* %arrayidx8, align 1, !dbg !149
  %10 = load i8*, i8** %data, align 8, !dbg !150
  call void @printLine(i8* %10), !dbg !151
  %11 = load i8*, i8** %data, align 8, !dbg !152
  call void @free(i8* %11) #6, !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !156, metadata !DIExpression()), !dbg !157
  store i8* null, i8** %data, align 8, !dbg !158
  %0 = load i32, i32* @globalFive, align 4, !dbg !159
  %cmp = icmp eq i32 %0, 5, !dbg !161
  br i1 %cmp, label %if.then, label %if.end3, !dbg !162

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !163
  store i8* %call, i8** %data, align 8, !dbg !165
  %1 = load i8*, i8** %data, align 8, !dbg !166
  %cmp1 = icmp eq i8* %1, null, !dbg !168
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !169

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !170
  unreachable, !dbg !170

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !172
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !172
  store i8 0, i8* %arrayidx, align 1, !dbg !173
  br label %if.end3, !dbg !174

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !175, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !178, metadata !DIExpression()), !dbg !179
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !180
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !181
  store i8 0, i8* %arrayidx4, align 1, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !186
  %cmp5 = icmp ult i64 %3, 100, !dbg !188
  br i1 %cmp5, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !192
  %5 = load i8, i8* %arrayidx6, align 1, !dbg !192
  %6 = load i8*, i8** %data, align 8, !dbg !193
  %7 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !193
  store i8 %5, i8* %arrayidx7, align 1, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %8, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !201
  %arrayidx8 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !201
  store i8 0, i8* %arrayidx8, align 1, !dbg !202
  %10 = load i8*, i8** %data, align 8, !dbg !203
  call void @printLine(i8* %10), !dbg !204
  %11 = load i8*, i8** %data, align 8, !dbg !205
  call void @free(i8* %11) #6, !dbg !206
  ret void, !dbg !207
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_14.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_14_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_14.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 18, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocation(line: 30, column: 24, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 14, scope: !26)
!28 = !DILocation(line: 31, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 13)
!30 = !DILocation(line: 31, column: 18, scope: !29)
!31 = !DILocation(line: 31, column: 13, scope: !26)
!32 = !DILocation(line: 31, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 31, column: 27)
!34 = !DILocation(line: 32, column: 9, scope: !26)
!35 = !DILocation(line: 32, column: 17, scope: !26)
!36 = !DILocation(line: 33, column: 5, scope: !26)
!37 = !DILocalVariable(name: "i", scope: !38, file: !15, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 35, column: 16, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !38, file: !15, line: 36, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 36, column: 14, scope: !38)
!48 = !DILocation(line: 37, column: 9, scope: !38)
!49 = !DILocation(line: 38, column: 9, scope: !38)
!50 = !DILocation(line: 38, column: 23, scope: !38)
!51 = !DILocation(line: 40, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !38, file: !15, line: 40, column: 9)
!53 = !DILocation(line: 40, column: 14, scope: !52)
!54 = !DILocation(line: 40, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !15, line: 40, column: 9)
!56 = !DILocation(line: 40, column: 23, scope: !55)
!57 = !DILocation(line: 40, column: 9, scope: !52)
!58 = !DILocation(line: 42, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !15, line: 41, column: 9)
!60 = !DILocation(line: 42, column: 23, scope: !59)
!61 = !DILocation(line: 42, column: 13, scope: !59)
!62 = !DILocation(line: 42, column: 18, scope: !59)
!63 = !DILocation(line: 42, column: 21, scope: !59)
!64 = !DILocation(line: 43, column: 9, scope: !59)
!65 = !DILocation(line: 40, column: 31, scope: !55)
!66 = !DILocation(line: 40, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 43, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 44, column: 9, scope: !38)
!71 = !DILocation(line: 44, column: 21, scope: !38)
!72 = !DILocation(line: 45, column: 19, scope: !38)
!73 = !DILocation(line: 45, column: 9, scope: !38)
!74 = !DILocation(line: 46, column: 14, scope: !38)
!75 = !DILocation(line: 46, column: 9, scope: !38)
!76 = !DILocation(line: 48, column: 1, scope: !14)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_14_good", scope: !15, file: !15, line: 115, type: !16, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 117, column: 5, scope: !77)
!79 = !DILocation(line: 118, column: 5, scope: !77)
!80 = !DILocation(line: 119, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 131, type: !82, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !15, line: 131, type: !84)
!87 = !DILocation(line: 131, column: 14, scope: !81)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !15, line: 131, type: !85)
!89 = !DILocation(line: 131, column: 27, scope: !81)
!90 = !DILocation(line: 134, column: 22, scope: !81)
!91 = !DILocation(line: 134, column: 12, scope: !81)
!92 = !DILocation(line: 134, column: 5, scope: !81)
!93 = !DILocation(line: 136, column: 5, scope: !81)
!94 = !DILocation(line: 137, column: 5, scope: !81)
!95 = !DILocation(line: 138, column: 5, scope: !81)
!96 = !DILocation(line: 141, column: 5, scope: !81)
!97 = !DILocation(line: 142, column: 5, scope: !81)
!98 = !DILocation(line: 143, column: 5, scope: !81)
!99 = !DILocation(line: 145, column: 5, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !15, line: 57, type: !4)
!102 = !DILocation(line: 57, column: 12, scope: !100)
!103 = !DILocation(line: 58, column: 10, scope: !100)
!104 = !DILocation(line: 59, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !15, line: 59, column: 8)
!106 = !DILocation(line: 59, column: 18, scope: !105)
!107 = !DILocation(line: 59, column: 8, scope: !100)
!108 = !DILocation(line: 62, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 60, column: 5)
!110 = !DILocation(line: 63, column: 5, scope: !109)
!111 = !DILocation(line: 67, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !15, line: 65, column: 5)
!113 = !DILocation(line: 67, column: 14, scope: !112)
!114 = !DILocation(line: 68, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !15, line: 68, column: 13)
!116 = !DILocation(line: 68, column: 18, scope: !115)
!117 = !DILocation(line: 68, column: 13, scope: !112)
!118 = !DILocation(line: 68, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 68, column: 27)
!120 = !DILocation(line: 69, column: 9, scope: !112)
!121 = !DILocation(line: 69, column: 17, scope: !112)
!122 = !DILocalVariable(name: "i", scope: !123, file: !15, line: 72, type: !39)
!123 = distinct !DILexicalBlock(scope: !100, file: !15, line: 71, column: 5)
!124 = !DILocation(line: 72, column: 16, scope: !123)
!125 = !DILocalVariable(name: "source", scope: !123, file: !15, line: 73, type: !44)
!126 = !DILocation(line: 73, column: 14, scope: !123)
!127 = !DILocation(line: 74, column: 9, scope: !123)
!128 = !DILocation(line: 75, column: 9, scope: !123)
!129 = !DILocation(line: 75, column: 23, scope: !123)
!130 = !DILocation(line: 77, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !123, file: !15, line: 77, column: 9)
!132 = !DILocation(line: 77, column: 14, scope: !131)
!133 = !DILocation(line: 77, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !15, line: 77, column: 9)
!135 = !DILocation(line: 77, column: 23, scope: !134)
!136 = !DILocation(line: 77, column: 9, scope: !131)
!137 = !DILocation(line: 79, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !15, line: 78, column: 9)
!139 = !DILocation(line: 79, column: 23, scope: !138)
!140 = !DILocation(line: 79, column: 13, scope: !138)
!141 = !DILocation(line: 79, column: 18, scope: !138)
!142 = !DILocation(line: 79, column: 21, scope: !138)
!143 = !DILocation(line: 80, column: 9, scope: !138)
!144 = !DILocation(line: 77, column: 31, scope: !134)
!145 = !DILocation(line: 77, column: 9, scope: !134)
!146 = distinct !{!146, !136, !147, !69}
!147 = !DILocation(line: 80, column: 9, scope: !131)
!148 = !DILocation(line: 81, column: 9, scope: !123)
!149 = !DILocation(line: 81, column: 21, scope: !123)
!150 = !DILocation(line: 82, column: 19, scope: !123)
!151 = !DILocation(line: 82, column: 9, scope: !123)
!152 = !DILocation(line: 83, column: 14, scope: !123)
!153 = !DILocation(line: 83, column: 9, scope: !123)
!154 = !DILocation(line: 85, column: 1, scope: !100)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocalVariable(name: "data", scope: !155, file: !15, line: 90, type: !4)
!157 = !DILocation(line: 90, column: 12, scope: !155)
!158 = !DILocation(line: 91, column: 10, scope: !155)
!159 = !DILocation(line: 92, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !15, line: 92, column: 8)
!161 = !DILocation(line: 92, column: 18, scope: !160)
!162 = !DILocation(line: 92, column: 8, scope: !155)
!163 = !DILocation(line: 95, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 93, column: 5)
!165 = !DILocation(line: 95, column: 14, scope: !164)
!166 = !DILocation(line: 96, column: 13, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !15, line: 96, column: 13)
!168 = !DILocation(line: 96, column: 18, scope: !167)
!169 = !DILocation(line: 96, column: 13, scope: !164)
!170 = !DILocation(line: 96, column: 28, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !15, line: 96, column: 27)
!172 = !DILocation(line: 97, column: 9, scope: !164)
!173 = !DILocation(line: 97, column: 17, scope: !164)
!174 = !DILocation(line: 98, column: 5, scope: !164)
!175 = !DILocalVariable(name: "i", scope: !176, file: !15, line: 100, type: !39)
!176 = distinct !DILexicalBlock(scope: !155, file: !15, line: 99, column: 5)
!177 = !DILocation(line: 100, column: 16, scope: !176)
!178 = !DILocalVariable(name: "source", scope: !176, file: !15, line: 101, type: !44)
!179 = !DILocation(line: 101, column: 14, scope: !176)
!180 = !DILocation(line: 102, column: 9, scope: !176)
!181 = !DILocation(line: 103, column: 9, scope: !176)
!182 = !DILocation(line: 103, column: 23, scope: !176)
!183 = !DILocation(line: 105, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !176, file: !15, line: 105, column: 9)
!185 = !DILocation(line: 105, column: 14, scope: !184)
!186 = !DILocation(line: 105, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !15, line: 105, column: 9)
!188 = !DILocation(line: 105, column: 23, scope: !187)
!189 = !DILocation(line: 105, column: 9, scope: !184)
!190 = !DILocation(line: 107, column: 30, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !15, line: 106, column: 9)
!192 = !DILocation(line: 107, column: 23, scope: !191)
!193 = !DILocation(line: 107, column: 13, scope: !191)
!194 = !DILocation(line: 107, column: 18, scope: !191)
!195 = !DILocation(line: 107, column: 21, scope: !191)
!196 = !DILocation(line: 108, column: 9, scope: !191)
!197 = !DILocation(line: 105, column: 31, scope: !187)
!198 = !DILocation(line: 105, column: 9, scope: !187)
!199 = distinct !{!199, !189, !200, !69}
!200 = !DILocation(line: 108, column: 9, scope: !184)
!201 = !DILocation(line: 109, column: 9, scope: !176)
!202 = !DILocation(line: 109, column: 21, scope: !176)
!203 = !DILocation(line: 110, column: 19, scope: !176)
!204 = !DILocation(line: 110, column: 9, scope: !176)
!205 = !DILocation(line: 111, column: 14, scope: !176)
!206 = !DILocation(line: 111, column: 9, scope: !176)
!207 = !DILocation(line: 113, column: 1, scope: !155)
