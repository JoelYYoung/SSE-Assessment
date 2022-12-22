; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !27
  store i32* %4, i32** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !34
  %6 = load i32*, i32** %data, align 8, !dbg !35
  %7 = bitcast i32* %6 to i8*, !dbg !36
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !36
  %8 = bitcast i32* %arraydecay to i8*, !dbg !36
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !36
  %9 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !37
  %10 = load i32, i32* %arrayidx, align 4, !dbg !37
  call void @printIntLine(i32 %10), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_15_good() #0 !dbg !40 {
entry:
  call void @goodG2B1(), !dbg !41
  call void @goodG2B2(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #6, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #6, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_15_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_15_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = alloca i8, i64 200, align 16, !dbg !69
  %1 = bitcast i8* %0 to i32*, !dbg !70
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %2 = alloca i8, i64 400, align 16, !dbg !73
  %3 = bitcast i8* %2 to i32*, !dbg !74
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !72
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !75
  store i32* %4, i32** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !79
  %6 = load i32*, i32** %data, align 8, !dbg !80
  %7 = bitcast i32* %6 to i8*, !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !81
  %8 = bitcast i32* %arraydecay to i8*, !dbg !81
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !81
  %9 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !82
  %10 = load i32, i32* %arrayidx, align 4, !dbg !82
  call void @printIntLine(i32 %10), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = alloca i8, i64 200, align 16, !dbg !90
  %1 = bitcast i8* %0 to i32*, !dbg !91
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %2 = alloca i8, i64 400, align 16, !dbg !94
  %3 = bitcast i8* %2 to i32*, !dbg !95
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !93
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !96
  store i32* %4, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  %7 = bitcast i32* %6 to i8*, !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %8 = bitcast i32* %arraydecay to i8*, !dbg !102
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !102
  %9 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !103
  %10 = load i32, i32* %arrayidx, align 4, !dbg !103
  call void @printIntLine(i32 %10), !dbg !104
  ret void, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_15_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_15.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 24, column: 34, scope: !13)
!22 = !DILocation(line: 24, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !4)
!24 = !DILocation(line: 25, column: 11, scope: !13)
!25 = !DILocation(line: 25, column: 35, scope: !13)
!26 = !DILocation(line: 25, column: 28, scope: !13)
!27 = !DILocation(line: 31, column: 16, scope: !13)
!28 = !DILocation(line: 31, column: 14, scope: !13)
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 39, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 39, column: 13, scope: !30)
!35 = !DILocation(line: 41, column: 17, scope: !30)
!36 = !DILocation(line: 41, column: 9, scope: !30)
!37 = !DILocation(line: 42, column: 22, scope: !30)
!38 = !DILocation(line: 42, column: 9, scope: !30)
!39 = !DILocation(line: 44, column: 1, scope: !13)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_15_good", scope: !14, file: !14, line: 100, type: !15, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 102, column: 5, scope: !40)
!42 = !DILocation(line: 103, column: 5, scope: !40)
!43 = !DILocation(line: 104, column: 1, scope: !40)
!44 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 116, type: !45, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!5, !5, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !14, line: 116, type: !5)
!51 = !DILocation(line: 116, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !14, line: 116, type: !47)
!53 = !DILocation(line: 116, column: 27, scope: !44)
!54 = !DILocation(line: 119, column: 22, scope: !44)
!55 = !DILocation(line: 119, column: 12, scope: !44)
!56 = !DILocation(line: 119, column: 5, scope: !44)
!57 = !DILocation(line: 121, column: 5, scope: !44)
!58 = !DILocation(line: 122, column: 5, scope: !44)
!59 = !DILocation(line: 123, column: 5, scope: !44)
!60 = !DILocation(line: 126, column: 5, scope: !44)
!61 = !DILocation(line: 127, column: 5, scope: !44)
!62 = !DILocation(line: 128, column: 5, scope: !44)
!63 = !DILocation(line: 130, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !14, line: 53, type: !4)
!66 = !DILocation(line: 53, column: 11, scope: !64)
!67 = !DILocalVariable(name: "dataBadBuffer", scope: !64, file: !14, line: 54, type: !4)
!68 = !DILocation(line: 54, column: 11, scope: !64)
!69 = !DILocation(line: 54, column: 34, scope: !64)
!70 = !DILocation(line: 54, column: 27, scope: !64)
!71 = !DILocalVariable(name: "dataGoodBuffer", scope: !64, file: !14, line: 55, type: !4)
!72 = !DILocation(line: 55, column: 11, scope: !64)
!73 = !DILocation(line: 55, column: 35, scope: !64)
!74 = !DILocation(line: 55, column: 28, scope: !64)
!75 = !DILocation(line: 64, column: 16, scope: !64)
!76 = !DILocation(line: 64, column: 14, scope: !64)
!77 = !DILocalVariable(name: "source", scope: !78, file: !14, line: 68, type: !31)
!78 = distinct !DILexicalBlock(scope: !64, file: !14, line: 67, column: 5)
!79 = !DILocation(line: 68, column: 13, scope: !78)
!80 = !DILocation(line: 70, column: 17, scope: !78)
!81 = !DILocation(line: 70, column: 9, scope: !78)
!82 = !DILocation(line: 71, column: 22, scope: !78)
!83 = !DILocation(line: 71, column: 9, scope: !78)
!84 = !DILocation(line: 73, column: 1, scope: !64)
!85 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !14, line: 78, type: !4)
!87 = !DILocation(line: 78, column: 11, scope: !85)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !14, line: 79, type: !4)
!89 = !DILocation(line: 79, column: 11, scope: !85)
!90 = !DILocation(line: 79, column: 34, scope: !85)
!91 = !DILocation(line: 79, column: 27, scope: !85)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !14, line: 80, type: !4)
!93 = !DILocation(line: 80, column: 11, scope: !85)
!94 = !DILocation(line: 80, column: 35, scope: !85)
!95 = !DILocation(line: 80, column: 28, scope: !85)
!96 = !DILocation(line: 85, column: 16, scope: !85)
!97 = !DILocation(line: 85, column: 14, scope: !85)
!98 = !DILocalVariable(name: "source", scope: !99, file: !14, line: 93, type: !31)
!99 = distinct !DILexicalBlock(scope: !85, file: !14, line: 92, column: 5)
!100 = !DILocation(line: 93, column: 13, scope: !99)
!101 = !DILocation(line: 95, column: 17, scope: !99)
!102 = !DILocation(line: 95, column: 9, scope: !99)
!103 = !DILocation(line: 96, column: 22, scope: !99)
!104 = !DILocation(line: 96, column: 9, scope: !99)
!105 = !DILocation(line: 98, column: 1, scope: !85)
