; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %call = call i64 @strlen(i8* %5) #6, !dbg !42
  store i64 %call, i64* %dataLen, align 8, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !47
  %7 = load i64, i64* %dataLen, align 8, !dbg !49
  %cmp = icmp ult i64 %6, %7, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !52
  %9 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !52
  %10 = load i8, i8* %arrayidx1, align 1, !dbg !52
  %11 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !56
  store i8 %10, i8* %arrayidx2, align 1, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %12, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !64
  store i8 0, i8* %arrayidx3, align 1, !dbg !65
  %13 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* %13), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #7, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #7, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = alloca i8, i64 100, align 16, !dbg !96
  store i8* %0, i8** %dataBuffer, align 8, !dbg !95
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  store i8* %1, i8** %data, align 8, !dbg !98
  %2 = load i8*, i8** %data, align 8, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !100
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !105
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !108, metadata !DIExpression()), !dbg !109
  %5 = load i8*, i8** %data, align 8, !dbg !110
  %call = call i64 @strlen(i8* %5) #6, !dbg !111
  store i64 %call, i64* %dataLen, align 8, !dbg !112
  store i64 0, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !116
  %7 = load i64, i64* %dataLen, align 8, !dbg !118
  %cmp = icmp ult i64 %6, %7, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !121
  %9 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx1 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !121
  %10 = load i8, i8* %arrayidx1, align 1, !dbg !121
  %11 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !125
  store i8 %10, i8* %arrayidx2, align 1, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !128
  %inc = add i64 %12, 1, !dbg !128
  store i64 %inc, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !132
  store i8 0, i8* %arrayidx3, align 1, !dbg !133
  %13 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %13), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 29, column: 12, scope: !13)
!25 = !DILocation(line: 29, column: 5, scope: !13)
!26 = !DILocation(line: 30, column: 5, scope: !13)
!27 = !DILocation(line: 30, column: 17, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 32, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 32, column: 14, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !29, file: !14, line: 33, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 33, column: 16, scope: !29)
!39 = !DILocalVariable(name: "dataLen", scope: !29, file: !14, line: 33, type: !35)
!40 = !DILocation(line: 33, column: 19, scope: !29)
!41 = !DILocation(line: 34, column: 26, scope: !29)
!42 = !DILocation(line: 34, column: 19, scope: !29)
!43 = !DILocation(line: 34, column: 17, scope: !29)
!44 = !DILocation(line: 36, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !29, file: !14, line: 36, column: 9)
!46 = !DILocation(line: 36, column: 14, scope: !45)
!47 = !DILocation(line: 36, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !14, line: 36, column: 9)
!49 = !DILocation(line: 36, column: 25, scope: !48)
!50 = !DILocation(line: 36, column: 23, scope: !48)
!51 = !DILocation(line: 36, column: 9, scope: !45)
!52 = !DILocation(line: 38, column: 23, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !14, line: 37, column: 9)
!54 = !DILocation(line: 38, column: 28, scope: !53)
!55 = !DILocation(line: 38, column: 18, scope: !53)
!56 = !DILocation(line: 38, column: 13, scope: !53)
!57 = !DILocation(line: 38, column: 21, scope: !53)
!58 = !DILocation(line: 39, column: 9, scope: !53)
!59 = !DILocation(line: 36, column: 35, scope: !48)
!60 = !DILocation(line: 36, column: 9, scope: !48)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 39, column: 9, scope: !45)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 40, column: 9, scope: !29)
!65 = !DILocation(line: 40, column: 20, scope: !29)
!66 = !DILocation(line: 41, column: 19, scope: !29)
!67 = !DILocation(line: 41, column: 9, scope: !29)
!68 = !DILocation(line: 43, column: 1, scope: !13)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_good", scope: !14, file: !14, line: 72, type: !15, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 74, column: 5, scope: !69)
!71 = !DILocation(line: 75, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !73, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !75, !76}
!75 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !14, line: 87, type: !75)
!78 = !DILocation(line: 87, column: 14, scope: !72)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !14, line: 87, type: !76)
!80 = !DILocation(line: 87, column: 27, scope: !72)
!81 = !DILocation(line: 90, column: 22, scope: !72)
!82 = !DILocation(line: 90, column: 12, scope: !72)
!83 = !DILocation(line: 90, column: 5, scope: !72)
!84 = !DILocation(line: 92, column: 5, scope: !72)
!85 = !DILocation(line: 93, column: 5, scope: !72)
!86 = !DILocation(line: 94, column: 5, scope: !72)
!87 = !DILocation(line: 97, column: 5, scope: !72)
!88 = !DILocation(line: 98, column: 5, scope: !72)
!89 = !DILocation(line: 99, column: 5, scope: !72)
!90 = !DILocation(line: 101, column: 5, scope: !72)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !14, line: 52, type: !4)
!93 = !DILocation(line: 52, column: 12, scope: !91)
!94 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !14, line: 53, type: !4)
!95 = !DILocation(line: 53, column: 12, scope: !91)
!96 = !DILocation(line: 53, column: 33, scope: !91)
!97 = !DILocation(line: 54, column: 12, scope: !91)
!98 = !DILocation(line: 54, column: 10, scope: !91)
!99 = !DILocation(line: 56, column: 12, scope: !91)
!100 = !DILocation(line: 56, column: 5, scope: !91)
!101 = !DILocation(line: 57, column: 5, scope: !91)
!102 = !DILocation(line: 57, column: 16, scope: !91)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !14, line: 59, type: !30)
!104 = distinct !DILexicalBlock(scope: !91, file: !14, line: 58, column: 5)
!105 = !DILocation(line: 59, column: 14, scope: !104)
!106 = !DILocalVariable(name: "i", scope: !104, file: !14, line: 60, type: !35)
!107 = !DILocation(line: 60, column: 16, scope: !104)
!108 = !DILocalVariable(name: "dataLen", scope: !104, file: !14, line: 60, type: !35)
!109 = !DILocation(line: 60, column: 19, scope: !104)
!110 = !DILocation(line: 61, column: 26, scope: !104)
!111 = !DILocation(line: 61, column: 19, scope: !104)
!112 = !DILocation(line: 61, column: 17, scope: !104)
!113 = !DILocation(line: 63, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !14, line: 63, column: 9)
!115 = !DILocation(line: 63, column: 14, scope: !114)
!116 = !DILocation(line: 63, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !14, line: 63, column: 9)
!118 = !DILocation(line: 63, column: 25, scope: !117)
!119 = !DILocation(line: 63, column: 23, scope: !117)
!120 = !DILocation(line: 63, column: 9, scope: !114)
!121 = !DILocation(line: 65, column: 23, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !14, line: 64, column: 9)
!123 = !DILocation(line: 65, column: 28, scope: !122)
!124 = !DILocation(line: 65, column: 18, scope: !122)
!125 = !DILocation(line: 65, column: 13, scope: !122)
!126 = !DILocation(line: 65, column: 21, scope: !122)
!127 = !DILocation(line: 66, column: 9, scope: !122)
!128 = !DILocation(line: 63, column: 35, scope: !117)
!129 = !DILocation(line: 63, column: 9, scope: !117)
!130 = distinct !{!130, !120, !131, !63}
!131 = !DILocation(line: 66, column: 9, scope: !114)
!132 = !DILocation(line: 67, column: 9, scope: !104)
!133 = !DILocation(line: 67, column: 20, scope: !104)
!134 = !DILocation(line: 68, column: 19, scope: !104)
!135 = !DILocation(line: 68, column: 9, scope: !104)
!136 = !DILocation(line: 70, column: 1, scope: !91)
