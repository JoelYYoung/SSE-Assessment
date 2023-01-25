; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_badSink(i32* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !24
  %1 = load i32*, i32** %data.addr, align 8, !dbg !25
  %2 = bitcast i32* %1 to i8*, !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !26
  %3 = bitcast i32* %arraydecay to i8*, !dbg !26
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !26
  %4 = load i32*, i32** %data.addr, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !27
  %5 = load i32, i32* %arrayidx, align 4, !dbg !27
  call void @printIntLine(i32 %5), !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_bad() #0 !dbg !30 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = alloca i8, i64 200, align 16, !dbg !37
  %1 = bitcast i8* %0 to i32*, !dbg !38
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !39, metadata !DIExpression()), !dbg !40
  %2 = alloca i8, i64 400, align 16, !dbg !41
  %3 = bitcast i8* %2 to i32*, !dbg !42
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !40
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !43
  store i32* %4, i32** %data, align 8, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_badSink(i32* %5), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_goodG2BSink(i32* %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !53
  %1 = load i32*, i32** %data.addr, align 8, !dbg !54
  %2 = bitcast i32* %1 to i8*, !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %3 = bitcast i32* %arraydecay to i8*, !dbg !55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !55
  %4 = load i32*, i32** %data.addr, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !56
  %5 = load i32, i32* %arrayidx, align 4, !dbg !56
  call void @printIntLine(i32 %5), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 200, align 16, !dbg !87
  %1 = bitcast i8* %0 to i32*, !dbg !88
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %2 = alloca i8, i64 400, align 16, !dbg !91
  %3 = bitcast i8* %2 to i32*, !dbg !92
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !90
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !93
  store i32* %4, i32** %data, align 8, !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_goodG2BSink(i32* %5), !dbg !96
  ret void, !dbg !97
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 21, type: !4)
!18 = !DILocation(line: 21, column: 85, scope: !13)
!19 = !DILocalVariable(name: "source", scope: !20, file: !14, line: 24, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 23, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 24, column: 13, scope: !20)
!25 = !DILocation(line: 26, column: 17, scope: !20)
!26 = !DILocation(line: 26, column: 9, scope: !20)
!27 = !DILocation(line: 27, column: 22, scope: !20)
!28 = !DILocation(line: 27, column: 9, scope: !20)
!29 = !DILocation(line: 29, column: 1, scope: !13)
!30 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_bad", scope: !14, file: !14, line: 31, type: !31, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 33, type: !4)
!34 = !DILocation(line: 33, column: 11, scope: !30)
!35 = !DILocalVariable(name: "dataBadBuffer", scope: !30, file: !14, line: 34, type: !4)
!36 = !DILocation(line: 34, column: 11, scope: !30)
!37 = !DILocation(line: 34, column: 34, scope: !30)
!38 = !DILocation(line: 34, column: 27, scope: !30)
!39 = !DILocalVariable(name: "dataGoodBuffer", scope: !30, file: !14, line: 35, type: !4)
!40 = !DILocation(line: 35, column: 11, scope: !30)
!41 = !DILocation(line: 35, column: 35, scope: !30)
!42 = !DILocation(line: 35, column: 28, scope: !30)
!43 = !DILocation(line: 38, column: 12, scope: !30)
!44 = !DILocation(line: 38, column: 10, scope: !30)
!45 = !DILocation(line: 39, column: 78, scope: !30)
!46 = !DILocation(line: 39, column: 5, scope: !30)
!47 = !DILocation(line: 40, column: 1, scope: !30)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_goodG2BSink", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !14, line: 46, type: !4)
!50 = !DILocation(line: 46, column: 89, scope: !48)
!51 = !DILocalVariable(name: "source", scope: !52, file: !14, line: 49, type: !21)
!52 = distinct !DILexicalBlock(scope: !48, file: !14, line: 48, column: 5)
!53 = !DILocation(line: 49, column: 13, scope: !52)
!54 = !DILocation(line: 51, column: 17, scope: !52)
!55 = !DILocation(line: 51, column: 9, scope: !52)
!56 = !DILocation(line: 52, column: 22, scope: !52)
!57 = !DILocation(line: 52, column: 9, scope: !52)
!58 = !DILocation(line: 54, column: 1, scope: !48)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_41_good", scope: !14, file: !14, line: 67, type: !31, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 69, column: 5, scope: !59)
!61 = !DILocation(line: 70, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 82, type: !63, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!5, !5, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !14, line: 82, type: !5)
!69 = !DILocation(line: 82, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !14, line: 82, type: !65)
!71 = !DILocation(line: 82, column: 27, scope: !62)
!72 = !DILocation(line: 85, column: 22, scope: !62)
!73 = !DILocation(line: 85, column: 12, scope: !62)
!74 = !DILocation(line: 85, column: 5, scope: !62)
!75 = !DILocation(line: 87, column: 5, scope: !62)
!76 = !DILocation(line: 88, column: 5, scope: !62)
!77 = !DILocation(line: 89, column: 5, scope: !62)
!78 = !DILocation(line: 92, column: 5, scope: !62)
!79 = !DILocation(line: 93, column: 5, scope: !62)
!80 = !DILocation(line: 94, column: 5, scope: !62)
!81 = !DILocation(line: 96, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 57, type: !31, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 59, type: !4)
!84 = !DILocation(line: 59, column: 11, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !14, line: 60, type: !4)
!86 = !DILocation(line: 60, column: 11, scope: !82)
!87 = !DILocation(line: 60, column: 34, scope: !82)
!88 = !DILocation(line: 60, column: 27, scope: !82)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !14, line: 61, type: !4)
!90 = !DILocation(line: 61, column: 11, scope: !82)
!91 = !DILocation(line: 61, column: 35, scope: !82)
!92 = !DILocation(line: 61, column: 28, scope: !82)
!93 = !DILocation(line: 63, column: 12, scope: !82)
!94 = !DILocation(line: 63, column: 10, scope: !82)
!95 = !DILocation(line: 64, column: 82, scope: !82)
!96 = !DILocation(line: 64, column: 5, scope: !82)
!97 = !DILocation(line: 65, column: 1, scope: !82)
