; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %1 = load i32*, i32** %0, align 8, !dbg !38
  store i32* %1, i32** %data1, align 8, !dbg !36
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay, i32** %data1, align 8, !dbg !40
  %2 = load i32*, i32** %data1, align 8, !dbg !41
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !42
  store i32* %2, i32** %3, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !44, metadata !DIExpression()), !dbg !46
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !47
  %5 = load i32*, i32** %4, align 8, !dbg !48
  store i32* %5, i32** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !51
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !51
  %7 = load i32*, i32** %data2, align 8, !dbg !52
  %8 = bitcast i32* %7 to i8*, !dbg !53
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %9 = bitcast i32* %arraydecay3 to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !53
  %10 = load i32*, i32** %data2, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 0, !dbg !54
  %11 = load i32, i32* %arrayidx, align 4, !dbg !54
  call void @printIntLine(i32 %11), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #6, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #6, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !83, metadata !DIExpression()), !dbg !84
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !85, metadata !DIExpression()), !dbg !86
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !91, metadata !DIExpression()), !dbg !93
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !94
  %1 = load i32*, i32** %0, align 8, !dbg !95
  store i32* %1, i32** %data1, align 8, !dbg !93
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay, i32** %data1, align 8, !dbg !97
  %2 = load i32*, i32** %data1, align 8, !dbg !98
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !99
  store i32* %2, i32** %3, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !101, metadata !DIExpression()), !dbg !103
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !104
  %5 = load i32*, i32** %4, align 8, !dbg !105
  store i32* %5, i32** %data2, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !108
  %7 = load i32*, i32** %data2, align 8, !dbg !109
  %8 = bitcast i32* %7 to i8*, !dbg !110
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %9 = bitcast i32* %arraydecay3 to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !110
  %10 = load i32*, i32** %data2, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 0, !dbg !111
  %11 = load i32, i32* %arrayidx, align 4, !dbg !111
  call void @printIntLine(i32 %11), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 11, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 24, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 24, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 25, type: !20)
!23 = !DILocation(line: 25, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 26, column: 9, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 9, scope: !11)
!34 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 29, type: !16)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!36 = !DILocation(line: 29, column: 15, scope: !35)
!37 = !DILocation(line: 29, column: 23, scope: !35)
!38 = !DILocation(line: 29, column: 22, scope: !35)
!39 = !DILocation(line: 32, column: 16, scope: !35)
!40 = !DILocation(line: 32, column: 14, scope: !35)
!41 = !DILocation(line: 33, column: 21, scope: !35)
!42 = !DILocation(line: 33, column: 10, scope: !35)
!43 = !DILocation(line: 33, column: 19, scope: !35)
!44 = !DILocalVariable(name: "data", scope: !45, file: !12, line: 36, type: !16)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!46 = !DILocation(line: 36, column: 15, scope: !45)
!47 = !DILocation(line: 36, column: 23, scope: !45)
!48 = !DILocation(line: 36, column: 22, scope: !45)
!49 = !DILocalVariable(name: "source", scope: !50, file: !12, line: 38, type: !30)
!50 = distinct !DILexicalBlock(scope: !45, file: !12, line: 37, column: 9)
!51 = !DILocation(line: 38, column: 17, scope: !50)
!52 = !DILocation(line: 40, column: 20, scope: !50)
!53 = !DILocation(line: 40, column: 13, scope: !50)
!54 = !DILocation(line: 41, column: 26, scope: !50)
!55 = !DILocation(line: 41, column: 13, scope: !50)
!56 = !DILocation(line: 44, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 77, column: 5, scope: !57)
!59 = !DILocation(line: 78, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !61, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!17, !17, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 89, type: !17)
!67 = !DILocation(line: 89, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 89, type: !63)
!69 = !DILocation(line: 89, column: 27, scope: !60)
!70 = !DILocation(line: 92, column: 22, scope: !60)
!71 = !DILocation(line: 92, column: 12, scope: !60)
!72 = !DILocation(line: 92, column: 5, scope: !60)
!73 = !DILocation(line: 94, column: 5, scope: !60)
!74 = !DILocation(line: 95, column: 5, scope: !60)
!75 = !DILocation(line: 96, column: 5, scope: !60)
!76 = !DILocation(line: 99, column: 5, scope: !60)
!77 = !DILocation(line: 100, column: 5, scope: !60)
!78 = !DILocation(line: 101, column: 5, scope: !60)
!79 = !DILocation(line: 103, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 53, type: !16)
!82 = !DILocation(line: 53, column: 11, scope: !80)
!83 = !DILocalVariable(name: "dataPtr1", scope: !80, file: !12, line: 54, type: !20)
!84 = !DILocation(line: 54, column: 12, scope: !80)
!85 = !DILocalVariable(name: "dataPtr2", scope: !80, file: !12, line: 55, type: !20)
!86 = !DILocation(line: 55, column: 12, scope: !80)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !12, line: 56, type: !25)
!88 = !DILocation(line: 56, column: 9, scope: !80)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !12, line: 57, type: !30)
!90 = !DILocation(line: 57, column: 9, scope: !80)
!91 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 59, type: !16)
!92 = distinct !DILexicalBlock(scope: !80, file: !12, line: 58, column: 5)
!93 = !DILocation(line: 59, column: 15, scope: !92)
!94 = !DILocation(line: 59, column: 23, scope: !92)
!95 = !DILocation(line: 59, column: 22, scope: !92)
!96 = !DILocation(line: 61, column: 16, scope: !92)
!97 = !DILocation(line: 61, column: 14, scope: !92)
!98 = !DILocation(line: 62, column: 21, scope: !92)
!99 = !DILocation(line: 62, column: 10, scope: !92)
!100 = !DILocation(line: 62, column: 19, scope: !92)
!101 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 65, type: !16)
!102 = distinct !DILexicalBlock(scope: !80, file: !12, line: 64, column: 5)
!103 = !DILocation(line: 65, column: 15, scope: !102)
!104 = !DILocation(line: 65, column: 23, scope: !102)
!105 = !DILocation(line: 65, column: 22, scope: !102)
!106 = !DILocalVariable(name: "source", scope: !107, file: !12, line: 67, type: !30)
!107 = distinct !DILexicalBlock(scope: !102, file: !12, line: 66, column: 9)
!108 = !DILocation(line: 67, column: 17, scope: !107)
!109 = !DILocation(line: 69, column: 20, scope: !107)
!110 = !DILocation(line: 69, column: 13, scope: !107)
!111 = !DILocation(line: 70, column: 26, scope: !107)
!112 = !DILocation(line: 70, column: 13, scope: !107)
!113 = !DILocation(line: 73, column: 1, scope: !80)
