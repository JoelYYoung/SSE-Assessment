; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !28
  %2 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_badData, align 8, !dbg !34
  call void @badSink(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #6, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #6, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_badData, align 8, !dbg !62
  store i8* %0, i8** %data, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !63, metadata !DIExpression()), !dbg !68
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !68
  call void @llvm.dbg.declare(metadata i64* %i, metadata !69, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !74, metadata !DIExpression()), !dbg !75
  %2 = load i8*, i8** %data, align 8, !dbg !76
  %call = call i64 @strlen(i8* %2) #7, !dbg !77
  store i64 %call, i64* %dataLen, align 8, !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !82
  %4 = load i64, i64* %dataLen, align 8, !dbg !84
  %cmp = icmp ult i64 %3, %4, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !87
  %6 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !87
  %7 = load i8, i8* %arrayidx, align 1, !dbg !87
  %8 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !91
  store i8 %7, i8* %arrayidx1, align 1, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %9, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !99
  store i8 0, i8* %arrayidx2, align 1, !dbg !100
  %10 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %10), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 100, align 16, !dbg !109
  store i8* %0, i8** %dataBuffer, align 8, !dbg !108
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  store i8* %1, i8** %data, align 8, !dbg !111
  %2 = load i8*, i8** %data, align 8, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !113
  %3 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %4 = load i8*, i8** %data, align 8, !dbg !116
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_goodG2BData, align 8, !dbg !117
  call void @goodG2BSink(), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !120 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_goodG2BData, align 8, !dbg !123
  store i8* %0, i8** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !129, metadata !DIExpression()), !dbg !130
  %2 = load i8*, i8** %data, align 8, !dbg !131
  %call = call i64 @strlen(i8* %2) #7, !dbg !132
  store i64 %call, i64* %dataLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !137
  %4 = load i64, i64* %dataLen, align 8, !dbg !139
  %cmp = icmp ult i64 %3, %4, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !142
  %6 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !142
  %7 = load i8, i8* %arrayidx, align 1, !dbg !142
  %8 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !146
  store i8 %7, i8* %arrayidx1, align 1, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %9, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !153
  store i8 0, i8* %arrayidx2, align 1, !dbg !154
  %10 = load i8*, i8** %data, align 8, !dbg !155
  call void @printLine(i8* %10), !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_badData", scope: !2, file: !12, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_goodG2BData", scope: !2, file: !12, line: 22, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45.c", directory: "/root/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_bad", scope: !12, file: !12, line: 43, type: !20, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 45, type: !6)
!23 = !DILocation(line: 45, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 46, type: !6)
!25 = !DILocation(line: 46, column: 12, scope: !19)
!26 = !DILocation(line: 46, column: 33, scope: !19)
!27 = !DILocation(line: 47, column: 12, scope: !19)
!28 = !DILocation(line: 47, column: 10, scope: !19)
!29 = !DILocation(line: 49, column: 12, scope: !19)
!30 = !DILocation(line: 49, column: 5, scope: !19)
!31 = !DILocation(line: 50, column: 5, scope: !19)
!32 = !DILocation(line: 50, column: 17, scope: !19)
!33 = !DILocation(line: 51, column: 78, scope: !19)
!34 = !DILocation(line: 51, column: 76, scope: !19)
!35 = !DILocation(line: 52, column: 5, scope: !19)
!36 = !DILocation(line: 53, column: 1, scope: !19)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_45_good", scope: !12, file: !12, line: 89, type: !20, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DILocation(line: 91, column: 5, scope: !37)
!39 = !DILocation(line: 92, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !41, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !12, line: 103, type: !43)
!46 = !DILocation(line: 103, column: 14, scope: !40)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !12, line: 103, type: !44)
!48 = !DILocation(line: 103, column: 27, scope: !40)
!49 = !DILocation(line: 106, column: 22, scope: !40)
!50 = !DILocation(line: 106, column: 12, scope: !40)
!51 = !DILocation(line: 106, column: 5, scope: !40)
!52 = !DILocation(line: 108, column: 5, scope: !40)
!53 = !DILocation(line: 109, column: 5, scope: !40)
!54 = !DILocation(line: 110, column: 5, scope: !40)
!55 = !DILocation(line: 113, column: 5, scope: !40)
!56 = !DILocation(line: 114, column: 5, scope: !40)
!57 = !DILocation(line: 115, column: 5, scope: !40)
!58 = !DILocation(line: 117, column: 5, scope: !40)
!59 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocalVariable(name: "data", scope: !59, file: !12, line: 28, type: !6)
!61 = !DILocation(line: 28, column: 12, scope: !59)
!62 = !DILocation(line: 28, column: 19, scope: !59)
!63 = !DILocalVariable(name: "dest", scope: !64, file: !12, line: 30, type: !65)
!64 = distinct !DILexicalBlock(scope: !59, file: !12, line: 29, column: 5)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 50)
!68 = !DILocation(line: 30, column: 14, scope: !64)
!69 = !DILocalVariable(name: "i", scope: !64, file: !12, line: 31, type: !70)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !71, line: 46, baseType: !72)
!71 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!72 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!73 = !DILocation(line: 31, column: 16, scope: !64)
!74 = !DILocalVariable(name: "dataLen", scope: !64, file: !12, line: 31, type: !70)
!75 = !DILocation(line: 31, column: 19, scope: !64)
!76 = !DILocation(line: 32, column: 26, scope: !64)
!77 = !DILocation(line: 32, column: 19, scope: !64)
!78 = !DILocation(line: 32, column: 17, scope: !64)
!79 = !DILocation(line: 34, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !64, file: !12, line: 34, column: 9)
!81 = !DILocation(line: 34, column: 14, scope: !80)
!82 = !DILocation(line: 34, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 34, column: 9)
!84 = !DILocation(line: 34, column: 25, scope: !83)
!85 = !DILocation(line: 34, column: 23, scope: !83)
!86 = !DILocation(line: 34, column: 9, scope: !80)
!87 = !DILocation(line: 36, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !12, line: 35, column: 9)
!89 = !DILocation(line: 36, column: 28, scope: !88)
!90 = !DILocation(line: 36, column: 18, scope: !88)
!91 = !DILocation(line: 36, column: 13, scope: !88)
!92 = !DILocation(line: 36, column: 21, scope: !88)
!93 = !DILocation(line: 37, column: 9, scope: !88)
!94 = !DILocation(line: 34, column: 35, scope: !83)
!95 = !DILocation(line: 34, column: 9, scope: !83)
!96 = distinct !{!96, !86, !97, !98}
!97 = !DILocation(line: 37, column: 9, scope: !80)
!98 = !{!"llvm.loop.mustprogress"}
!99 = !DILocation(line: 38, column: 9, scope: !64)
!100 = !DILocation(line: 38, column: 20, scope: !64)
!101 = !DILocation(line: 39, column: 19, scope: !64)
!102 = !DILocation(line: 39, column: 9, scope: !64)
!103 = !DILocation(line: 41, column: 1, scope: !59)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 77, type: !20, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 79, type: !6)
!106 = !DILocation(line: 79, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !12, line: 80, type: !6)
!108 = !DILocation(line: 80, column: 12, scope: !104)
!109 = !DILocation(line: 80, column: 33, scope: !104)
!110 = !DILocation(line: 81, column: 12, scope: !104)
!111 = !DILocation(line: 81, column: 10, scope: !104)
!112 = !DILocation(line: 83, column: 12, scope: !104)
!113 = !DILocation(line: 83, column: 5, scope: !104)
!114 = !DILocation(line: 84, column: 5, scope: !104)
!115 = !DILocation(line: 84, column: 16, scope: !104)
!116 = !DILocation(line: 85, column: 82, scope: !104)
!117 = !DILocation(line: 85, column: 80, scope: !104)
!118 = !DILocation(line: 86, column: 5, scope: !104)
!119 = !DILocation(line: 87, column: 1, scope: !104)
!120 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 60, type: !20, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 62, type: !6)
!122 = !DILocation(line: 62, column: 12, scope: !120)
!123 = !DILocation(line: 62, column: 19, scope: !120)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !12, line: 64, type: !65)
!125 = distinct !DILexicalBlock(scope: !120, file: !12, line: 63, column: 5)
!126 = !DILocation(line: 64, column: 14, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !12, line: 65, type: !70)
!128 = !DILocation(line: 65, column: 16, scope: !125)
!129 = !DILocalVariable(name: "dataLen", scope: !125, file: !12, line: 65, type: !70)
!130 = !DILocation(line: 65, column: 19, scope: !125)
!131 = !DILocation(line: 66, column: 26, scope: !125)
!132 = !DILocation(line: 66, column: 19, scope: !125)
!133 = !DILocation(line: 66, column: 17, scope: !125)
!134 = !DILocation(line: 68, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !12, line: 68, column: 9)
!136 = !DILocation(line: 68, column: 14, scope: !135)
!137 = !DILocation(line: 68, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 68, column: 9)
!139 = !DILocation(line: 68, column: 25, scope: !138)
!140 = !DILocation(line: 68, column: 23, scope: !138)
!141 = !DILocation(line: 68, column: 9, scope: !135)
!142 = !DILocation(line: 70, column: 23, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !12, line: 69, column: 9)
!144 = !DILocation(line: 70, column: 28, scope: !143)
!145 = !DILocation(line: 70, column: 18, scope: !143)
!146 = !DILocation(line: 70, column: 13, scope: !143)
!147 = !DILocation(line: 70, column: 21, scope: !143)
!148 = !DILocation(line: 71, column: 9, scope: !143)
!149 = !DILocation(line: 68, column: 35, scope: !138)
!150 = !DILocation(line: 68, column: 9, scope: !138)
!151 = distinct !{!151, !141, !152, !98}
!152 = !DILocation(line: 71, column: 9, scope: !135)
!153 = !DILocation(line: 72, column: 9, scope: !125)
!154 = !DILocation(line: 72, column: 20, scope: !125)
!155 = !DILocation(line: 73, column: 19, scope: !125)
!156 = !DILocation(line: 73, column: 9, scope: !125)
!157 = !DILocation(line: 75, column: 1, scope: !120)
