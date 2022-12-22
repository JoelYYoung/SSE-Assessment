; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_02_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !35
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %2 = bitcast i32* %1 to i8*, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !38
  %5 = load i32, i32* %arrayidx, align 4, !dbg !38
  call void @printIntLine(i32 %5), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_02_good() #0 !dbg !41 {
entry:
  call void @goodG2B1(), !dbg !42
  call void @goodG2B2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #6, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #6, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_02_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_02_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !72
  store i32* %arraydecay, i32** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !76, metadata !DIExpression()), !dbg !78
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !78
  %1 = load i32*, i32** %data, align 8, !dbg !79
  %2 = bitcast i32* %1 to i8*, !dbg !80
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !80
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !80
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !80
  %4 = load i32*, i32** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !81
  %5 = load i32, i32* %arrayidx, align 4, !dbg !81
  call void @printIntLine(i32 %5), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i32* %arraydecay, i32** %data, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !97
  %1 = load i32*, i32** %data, align 8, !dbg !98
  %2 = bitcast i32* %1 to i8*, !dbg !99
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !99
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !99
  %4 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !100
  %5 = load i32, i32* %arrayidx, align 4, !dbg !100
  call void @printIntLine(i32 %5), !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_02.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_02_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_02.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 11, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 24, column: 9, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 25, column: 9, scope: !11)
!29 = !DILocation(line: 30, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !12, line: 27, column: 5)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!32 = !DILocation(line: 30, column: 14, scope: !30)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 33, type: !25)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!35 = !DILocation(line: 33, column: 13, scope: !34)
!36 = !DILocation(line: 35, column: 16, scope: !34)
!37 = !DILocation(line: 35, column: 9, scope: !34)
!38 = !DILocation(line: 36, column: 22, scope: !34)
!39 = !DILocation(line: 36, column: 9, scope: !34)
!40 = !DILocation(line: 38, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_02_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 89, column: 5, scope: !41)
!43 = !DILocation(line: 90, column: 5, scope: !41)
!44 = !DILocation(line: 91, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !46, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!17, !17, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 103, type: !17)
!52 = !DILocation(line: 103, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 103, type: !48)
!54 = !DILocation(line: 103, column: 27, scope: !45)
!55 = !DILocation(line: 106, column: 22, scope: !45)
!56 = !DILocation(line: 106, column: 12, scope: !45)
!57 = !DILocation(line: 106, column: 5, scope: !45)
!58 = !DILocation(line: 108, column: 5, scope: !45)
!59 = !DILocation(line: 109, column: 5, scope: !45)
!60 = !DILocation(line: 110, column: 5, scope: !45)
!61 = !DILocation(line: 113, column: 5, scope: !45)
!62 = !DILocation(line: 114, column: 5, scope: !45)
!63 = !DILocation(line: 115, column: 5, scope: !45)
!64 = !DILocation(line: 117, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 47, type: !16)
!67 = !DILocation(line: 47, column: 11, scope: !65)
!68 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !12, line: 48, type: !20)
!69 = !DILocation(line: 48, column: 9, scope: !65)
!70 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !12, line: 49, type: !25)
!71 = !DILocation(line: 49, column: 9, scope: !65)
!72 = !DILocation(line: 58, column: 16, scope: !73)
!73 = distinct !DILexicalBlock(scope: !74, file: !12, line: 56, column: 5)
!74 = distinct !DILexicalBlock(scope: !65, file: !12, line: 50, column: 8)
!75 = !DILocation(line: 58, column: 14, scope: !73)
!76 = !DILocalVariable(name: "source", scope: !77, file: !12, line: 61, type: !25)
!77 = distinct !DILexicalBlock(scope: !65, file: !12, line: 60, column: 5)
!78 = !DILocation(line: 61, column: 13, scope: !77)
!79 = !DILocation(line: 63, column: 16, scope: !77)
!80 = !DILocation(line: 63, column: 9, scope: !77)
!81 = !DILocation(line: 64, column: 22, scope: !77)
!82 = !DILocation(line: 64, column: 9, scope: !77)
!83 = !DILocation(line: 66, column: 1, scope: !65)
!84 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 71, type: !16)
!86 = !DILocation(line: 71, column: 11, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !12, line: 72, type: !20)
!88 = !DILocation(line: 72, column: 9, scope: !84)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !12, line: 73, type: !25)
!90 = !DILocation(line: 73, column: 9, scope: !84)
!91 = !DILocation(line: 77, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !12, line: 75, column: 5)
!93 = distinct !DILexicalBlock(scope: !84, file: !12, line: 74, column: 8)
!94 = !DILocation(line: 77, column: 14, scope: !92)
!95 = !DILocalVariable(name: "source", scope: !96, file: !12, line: 80, type: !25)
!96 = distinct !DILexicalBlock(scope: !84, file: !12, line: 79, column: 5)
!97 = !DILocation(line: 80, column: 13, scope: !96)
!98 = !DILocation(line: 82, column: 16, scope: !96)
!99 = !DILocation(line: 82, column: 9, scope: !96)
!100 = !DILocation(line: 83, column: 22, scope: !96)
!101 = !DILocation(line: 83, column: 9, scope: !96)
!102 = !DILocation(line: 85, column: 1, scope: !84)
