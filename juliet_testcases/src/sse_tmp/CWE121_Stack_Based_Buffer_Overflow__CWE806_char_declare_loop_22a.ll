; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_badGlobal, align 4, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_badSource(i8* %0), !dbg !36
  store i8* %call, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %2 = load i8*, i8** %data, align 8, !dbg !51
  %call1 = call i64 @strlen(i8* %2) #6, !dbg !52
  store i64 %call1, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !57
  %4 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp = icmp ult i64 %3, %4, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !62
  %6 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !62
  %7 = load i8, i8* %arrayidx, align 1, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !66
  store i8 %7, i8* %arrayidx2, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %9, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !74
  store i8 0, i8* %arrayidx3, align 1, !dbg !75
  %10 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %10), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_good() #0 !dbg !79 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !106
  store i8* %arraydecay, i8** %data, align 8, !dbg !107
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_goodG2B1Global, align 4, !dbg !108
  %0 = load i8*, i8** %data, align 8, !dbg !109
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_goodG2B1Source(i8* %0), !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !117, metadata !DIExpression()), !dbg !118
  %2 = load i8*, i8** %data, align 8, !dbg !119
  %call1 = call i64 @strlen(i8* %2) #6, !dbg !120
  store i64 %call1, i64* %dataLen, align 8, !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !125
  %4 = load i64, i64* %dataLen, align 8, !dbg !127
  %cmp = icmp ult i64 %3, %4, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !130
  %6 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !130
  %7 = load i8, i8* %arrayidx, align 1, !dbg !130
  %8 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !134
  store i8 %7, i8* %arrayidx2, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %9, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !141
  store i8 0, i8* %arrayidx3, align 1, !dbg !142
  %10 = load i8*, i8** %data, align 8, !dbg !143
  call void @printLine(i8* %10), !dbg !144
  ret void, !dbg !145
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !146 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !151
  store i8* %arraydecay, i8** %data, align 8, !dbg !152
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_goodG2B2Global, align 4, !dbg !153
  %0 = load i8*, i8** %data, align 8, !dbg !154
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_goodG2B2Source(i8* %0), !dbg !155
  store i8* %call, i8** %data, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !157, metadata !DIExpression()), !dbg !159
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !162, metadata !DIExpression()), !dbg !163
  %2 = load i8*, i8** %data, align 8, !dbg !164
  %call1 = call i64 @strlen(i8* %2) #6, !dbg !165
  store i64 %call1, i64* %dataLen, align 8, !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !170
  %4 = load i64, i64* %dataLen, align 8, !dbg !172
  %cmp = icmp ult i64 %3, %4, !dbg !173
  br i1 %cmp, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !175
  %6 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !175
  %7 = load i8, i8* %arrayidx, align 1, !dbg !175
  %8 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !179
  store i8 %7, i8* %arrayidx2, align 1, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !182
  %inc = add i64 %9, 1, !dbg !182
  store i64 %inc, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !186
  store i8 0, i8* %arrayidx3, align 1, !dbg !187
  %10 = load i8*, i8** %data, align 8, !dbg !188
  call void @printLine(i8* %10), !dbg !189
  ret void, !dbg !190
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_goodG2B1Global", scope: !2, file: !10, line: 54, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_goodG2B2Global", scope: !2, file: !10, line: 55, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 30, column: 12, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 31, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 31, column: 10, scope: !20)
!32 = !DILocation(line: 32, column: 12, scope: !20)
!33 = !DILocation(line: 32, column: 10, scope: !20)
!34 = !DILocation(line: 33, column: 79, scope: !20)
!35 = !DILocation(line: 34, column: 86, scope: !20)
!36 = !DILocation(line: 34, column: 12, scope: !20)
!37 = !DILocation(line: 34, column: 10, scope: !20)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !20, file: !10, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 36, column: 14, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !10, line: 37, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 37, column: 16, scope: !39)
!49 = !DILocalVariable(name: "dataLen", scope: !39, file: !10, line: 37, type: !45)
!50 = !DILocation(line: 37, column: 19, scope: !39)
!51 = !DILocation(line: 38, column: 26, scope: !39)
!52 = !DILocation(line: 38, column: 19, scope: !39)
!53 = !DILocation(line: 38, column: 17, scope: !39)
!54 = !DILocation(line: 40, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !39, file: !10, line: 40, column: 9)
!56 = !DILocation(line: 40, column: 14, scope: !55)
!57 = !DILocation(line: 40, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !10, line: 40, column: 9)
!59 = !DILocation(line: 40, column: 25, scope: !58)
!60 = !DILocation(line: 40, column: 23, scope: !58)
!61 = !DILocation(line: 40, column: 9, scope: !55)
!62 = !DILocation(line: 42, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !10, line: 41, column: 9)
!64 = !DILocation(line: 42, column: 28, scope: !63)
!65 = !DILocation(line: 42, column: 18, scope: !63)
!66 = !DILocation(line: 42, column: 13, scope: !63)
!67 = !DILocation(line: 42, column: 21, scope: !63)
!68 = !DILocation(line: 43, column: 9, scope: !63)
!69 = !DILocation(line: 40, column: 35, scope: !58)
!70 = !DILocation(line: 40, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 43, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 44, column: 9, scope: !39)
!75 = !DILocation(line: 44, column: 20, scope: !39)
!76 = !DILocation(line: 45, column: 19, scope: !39)
!77 = !DILocation(line: 45, column: 9, scope: !39)
!78 = !DILocation(line: 47, column: 1, scope: !20)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_22_good", scope: !10, file: !10, line: 105, type: !21, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 107, column: 5, scope: !79)
!81 = !DILocation(line: 108, column: 5, scope: !79)
!82 = !DILocation(line: 109, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 121, type: !84, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!11, !11, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !10, line: 121, type: !11)
!88 = !DILocation(line: 121, column: 14, scope: !83)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !10, line: 121, type: !86)
!90 = !DILocation(line: 121, column: 27, scope: !83)
!91 = !DILocation(line: 124, column: 22, scope: !83)
!92 = !DILocation(line: 124, column: 12, scope: !83)
!93 = !DILocation(line: 124, column: 5, scope: !83)
!94 = !DILocation(line: 126, column: 5, scope: !83)
!95 = !DILocation(line: 127, column: 5, scope: !83)
!96 = !DILocation(line: 128, column: 5, scope: !83)
!97 = !DILocation(line: 131, column: 5, scope: !83)
!98 = !DILocation(line: 132, column: 5, scope: !83)
!99 = !DILocation(line: 133, column: 5, scope: !83)
!100 = !DILocation(line: 135, column: 5, scope: !83)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !10, line: 62, type: !24)
!103 = !DILocation(line: 62, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !10, line: 63, type: !28)
!105 = !DILocation(line: 63, column: 10, scope: !101)
!106 = !DILocation(line: 64, column: 12, scope: !101)
!107 = !DILocation(line: 64, column: 10, scope: !101)
!108 = !DILocation(line: 65, column: 84, scope: !101)
!109 = !DILocation(line: 66, column: 91, scope: !101)
!110 = !DILocation(line: 66, column: 12, scope: !101)
!111 = !DILocation(line: 66, column: 10, scope: !101)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !10, line: 68, type: !40)
!113 = distinct !DILexicalBlock(scope: !101, file: !10, line: 67, column: 5)
!114 = !DILocation(line: 68, column: 14, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !113, file: !10, line: 69, type: !45)
!116 = !DILocation(line: 69, column: 16, scope: !113)
!117 = !DILocalVariable(name: "dataLen", scope: !113, file: !10, line: 69, type: !45)
!118 = !DILocation(line: 69, column: 19, scope: !113)
!119 = !DILocation(line: 70, column: 26, scope: !113)
!120 = !DILocation(line: 70, column: 19, scope: !113)
!121 = !DILocation(line: 70, column: 17, scope: !113)
!122 = !DILocation(line: 72, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !113, file: !10, line: 72, column: 9)
!124 = !DILocation(line: 72, column: 14, scope: !123)
!125 = !DILocation(line: 72, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !10, line: 72, column: 9)
!127 = !DILocation(line: 72, column: 25, scope: !126)
!128 = !DILocation(line: 72, column: 23, scope: !126)
!129 = !DILocation(line: 72, column: 9, scope: !123)
!130 = !DILocation(line: 74, column: 23, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !10, line: 73, column: 9)
!132 = !DILocation(line: 74, column: 28, scope: !131)
!133 = !DILocation(line: 74, column: 18, scope: !131)
!134 = !DILocation(line: 74, column: 13, scope: !131)
!135 = !DILocation(line: 74, column: 21, scope: !131)
!136 = !DILocation(line: 75, column: 9, scope: !131)
!137 = !DILocation(line: 72, column: 35, scope: !126)
!138 = !DILocation(line: 72, column: 9, scope: !126)
!139 = distinct !{!139, !129, !140, !73}
!140 = !DILocation(line: 75, column: 9, scope: !123)
!141 = !DILocation(line: 76, column: 9, scope: !113)
!142 = !DILocation(line: 76, column: 20, scope: !113)
!143 = !DILocation(line: 77, column: 19, scope: !113)
!144 = !DILocation(line: 77, column: 9, scope: !113)
!145 = !DILocation(line: 79, column: 1, scope: !101)
!146 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 84, type: !21, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!147 = !DILocalVariable(name: "data", scope: !146, file: !10, line: 86, type: !24)
!148 = !DILocation(line: 86, column: 12, scope: !146)
!149 = !DILocalVariable(name: "dataBuffer", scope: !146, file: !10, line: 87, type: !28)
!150 = !DILocation(line: 87, column: 10, scope: !146)
!151 = !DILocation(line: 88, column: 12, scope: !146)
!152 = !DILocation(line: 88, column: 10, scope: !146)
!153 = !DILocation(line: 89, column: 84, scope: !146)
!154 = !DILocation(line: 90, column: 91, scope: !146)
!155 = !DILocation(line: 90, column: 12, scope: !146)
!156 = !DILocation(line: 90, column: 10, scope: !146)
!157 = !DILocalVariable(name: "dest", scope: !158, file: !10, line: 92, type: !40)
!158 = distinct !DILexicalBlock(scope: !146, file: !10, line: 91, column: 5)
!159 = !DILocation(line: 92, column: 14, scope: !158)
!160 = !DILocalVariable(name: "i", scope: !158, file: !10, line: 93, type: !45)
!161 = !DILocation(line: 93, column: 16, scope: !158)
!162 = !DILocalVariable(name: "dataLen", scope: !158, file: !10, line: 93, type: !45)
!163 = !DILocation(line: 93, column: 19, scope: !158)
!164 = !DILocation(line: 94, column: 26, scope: !158)
!165 = !DILocation(line: 94, column: 19, scope: !158)
!166 = !DILocation(line: 94, column: 17, scope: !158)
!167 = !DILocation(line: 96, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !158, file: !10, line: 96, column: 9)
!169 = !DILocation(line: 96, column: 14, scope: !168)
!170 = !DILocation(line: 96, column: 21, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !10, line: 96, column: 9)
!172 = !DILocation(line: 96, column: 25, scope: !171)
!173 = !DILocation(line: 96, column: 23, scope: !171)
!174 = !DILocation(line: 96, column: 9, scope: !168)
!175 = !DILocation(line: 98, column: 23, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !10, line: 97, column: 9)
!177 = !DILocation(line: 98, column: 28, scope: !176)
!178 = !DILocation(line: 98, column: 18, scope: !176)
!179 = !DILocation(line: 98, column: 13, scope: !176)
!180 = !DILocation(line: 98, column: 21, scope: !176)
!181 = !DILocation(line: 99, column: 9, scope: !176)
!182 = !DILocation(line: 96, column: 35, scope: !171)
!183 = !DILocation(line: 96, column: 9, scope: !171)
!184 = distinct !{!184, !174, !185, !73}
!185 = !DILocation(line: 99, column: 9, scope: !168)
!186 = !DILocation(line: 100, column: 9, scope: !158)
!187 = !DILocation(line: 100, column: 20, scope: !158)
!188 = !DILocation(line: 101, column: 19, scope: !158)
!189 = !DILocation(line: 101, column: 9, scope: !158)
!190 = !DILocation(line: 103, column: 1, scope: !146)
