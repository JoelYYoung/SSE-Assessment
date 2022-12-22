; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01_bad.source to i8*), i64 44, i1 false), !dbg !38
  %7 = load i32*, i32** %data, align 8, !dbg !39
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !40
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !41
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !42
  %add = add i64 %call, 1, !dbg !43
  %call2 = call i32* @wcsncpy(i32* %7, i32* %arraydecay, i64 %add) #7, !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %8), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 40, align 16, !dbg !76
  %1 = bitcast i8* %0 to i32*, !dbg !77
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = alloca i8, i64 44, align 16, !dbg !80
  %3 = bitcast i8* %2 to i32*, !dbg !81
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !79
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !82
  store i32* %4, i32** %data, align 8, !dbg !83
  %5 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !88
  %7 = load i32*, i32** %data, align 8, !dbg !89
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !90
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !91
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !92
  %add = add i64 %call, 1, !dbg !93
  %call2 = call i32* @wcsncpy(i32* %7, i32* %arraydecay, i64 %add) #7, !dbg !94
  %8 = load i32*, i32** %data, align 8, !dbg !95
  call void @printWLine(i32* %8), !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 35, column: 12, scope: !15)
!30 = !DILocation(line: 35, column: 10, scope: !15)
!31 = !DILocation(line: 36, column: 5, scope: !15)
!32 = !DILocation(line: 36, column: 13, scope: !15)
!33 = !DILocalVariable(name: "source", scope: !34, file: !16, line: 38, type: !35)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 38, column: 17, scope: !34)
!39 = !DILocation(line: 41, column: 17, scope: !34)
!40 = !DILocation(line: 41, column: 23, scope: !34)
!41 = !DILocation(line: 41, column: 38, scope: !34)
!42 = !DILocation(line: 41, column: 31, scope: !34)
!43 = !DILocation(line: 41, column: 46, scope: !34)
!44 = !DILocation(line: 41, column: 9, scope: !34)
!45 = !DILocation(line: 42, column: 20, scope: !34)
!46 = !DILocation(line: 42, column: 9, scope: !34)
!47 = !DILocation(line: 44, column: 1, scope: !15)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_01_good", scope: !16, file: !16, line: 69, type: !17, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 71, column: 5, scope: !48)
!50 = !DILocation(line: 72, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 84, type: !52, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!7, !7, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !16, line: 84, type: !7)
!58 = !DILocation(line: 84, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !16, line: 84, type: !54)
!60 = !DILocation(line: 84, column: 27, scope: !51)
!61 = !DILocation(line: 87, column: 22, scope: !51)
!62 = !DILocation(line: 87, column: 12, scope: !51)
!63 = !DILocation(line: 87, column: 5, scope: !51)
!64 = !DILocation(line: 89, column: 5, scope: !51)
!65 = !DILocation(line: 90, column: 5, scope: !51)
!66 = !DILocation(line: 91, column: 5, scope: !51)
!67 = !DILocation(line: 94, column: 5, scope: !51)
!68 = !DILocation(line: 95, column: 5, scope: !51)
!69 = !DILocation(line: 96, column: 5, scope: !51)
!70 = !DILocation(line: 98, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !16, line: 53, type: !4)
!73 = !DILocation(line: 53, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !16, line: 54, type: !4)
!75 = !DILocation(line: 54, column: 15, scope: !71)
!76 = !DILocation(line: 54, column: 42, scope: !71)
!77 = !DILocation(line: 54, column: 31, scope: !71)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !16, line: 55, type: !4)
!79 = !DILocation(line: 55, column: 15, scope: !71)
!80 = !DILocation(line: 55, column: 43, scope: !71)
!81 = !DILocation(line: 55, column: 32, scope: !71)
!82 = !DILocation(line: 58, column: 12, scope: !71)
!83 = !DILocation(line: 58, column: 10, scope: !71)
!84 = !DILocation(line: 59, column: 5, scope: !71)
!85 = !DILocation(line: 59, column: 13, scope: !71)
!86 = !DILocalVariable(name: "source", scope: !87, file: !16, line: 61, type: !35)
!87 = distinct !DILexicalBlock(scope: !71, file: !16, line: 60, column: 5)
!88 = !DILocation(line: 61, column: 17, scope: !87)
!89 = !DILocation(line: 64, column: 17, scope: !87)
!90 = !DILocation(line: 64, column: 23, scope: !87)
!91 = !DILocation(line: 64, column: 38, scope: !87)
!92 = !DILocation(line: 64, column: 31, scope: !87)
!93 = !DILocation(line: 64, column: 46, scope: !87)
!94 = !DILocation(line: 64, column: 9, scope: !87)
!95 = !DILocation(line: 65, column: 20, scope: !87)
!96 = !DILocation(line: 65, column: 9, scope: !87)
!97 = !DILocation(line: 67, column: 1, scope: !71)
