; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i8* %arraydecay, i8** %data, align 8, !dbg !37
  %0 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %1 = load i8*, i8** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_unionType* %myUnion to i8**, !dbg !41
  store i8* %1, i8** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_unionType* %myUnion to i8**, !dbg !46
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !46
  store i8* %2, i8** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx3, align 1, !dbg !52
  %3 = load i8*, i8** %data1, align 8, !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !54
  %4 = load i8*, i8** %data1, align 8, !dbg !55
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !55
  store i8 0, i8* %arrayidx5, align 1, !dbg !56
  %5 = load i8*, i8** %data1, align 8, !dbg !57
  call void @printLine(i8* %5), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_unionType* %myUnion, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i8* %arraydecay, i8** %data, align 8, !dbg !92
  %0 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_unionType* %myUnion to i8**, !dbg !96
  store i8* %1, i8** %unionFirst, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !98, metadata !DIExpression()), !dbg !100
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_unionType* %myUnion to i8**, !dbg !101
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !101
  store i8* %2, i8** %data1, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !105
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx3, align 1, !dbg !107
  %3 = load i8*, i8** %data1, align 8, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !109
  %4 = load i8*, i8** %data1, align 8, !dbg !110
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !110
  store i8 0, i8* %arrayidx5, align 1, !dbg !111
  %5 = load i8*, i8** %data1, align 8, !dbg !112
  call void @printLine(i8* %5), !dbg !113
  ret void, !dbg !114
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_unionType", file: !12, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 23, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 24, baseType: !16, size: 64)
!25 = !DILocation(line: 32, column: 81, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 33, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 10, scope: !11)
!36 = !DILocation(line: 37, column: 12, scope: !11)
!37 = !DILocation(line: 37, column: 10, scope: !11)
!38 = !DILocation(line: 38, column: 5, scope: !11)
!39 = !DILocation(line: 38, column: 13, scope: !11)
!40 = !DILocation(line: 39, column: 26, scope: !11)
!41 = !DILocation(line: 39, column: 13, scope: !11)
!42 = !DILocation(line: 39, column: 24, scope: !11)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 41, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!45 = !DILocation(line: 41, column: 16, scope: !44)
!46 = !DILocation(line: 41, column: 31, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !12, line: 43, type: !32)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 42, column: 9)
!49 = !DILocation(line: 43, column: 18, scope: !48)
!50 = !DILocation(line: 44, column: 13, scope: !48)
!51 = !DILocation(line: 45, column: 13, scope: !48)
!52 = !DILocation(line: 45, column: 27, scope: !48)
!53 = !DILocation(line: 47, column: 20, scope: !48)
!54 = !DILocation(line: 47, column: 13, scope: !48)
!55 = !DILocation(line: 48, column: 13, scope: !48)
!56 = !DILocation(line: 48, column: 25, scope: !48)
!57 = !DILocation(line: 49, column: 23, scope: !48)
!58 = !DILocation(line: 49, column: 13, scope: !48)
!59 = !DILocation(line: 52, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_34_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 85, column: 5, scope: !60)
!62 = !DILocation(line: 86, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !64, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 97, type: !66)
!69 = !DILocation(line: 97, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 97, type: !67)
!71 = !DILocation(line: 97, column: 27, scope: !63)
!72 = !DILocation(line: 100, column: 22, scope: !63)
!73 = !DILocation(line: 100, column: 12, scope: !63)
!74 = !DILocation(line: 100, column: 5, scope: !63)
!75 = !DILocation(line: 102, column: 5, scope: !63)
!76 = !DILocation(line: 103, column: 5, scope: !63)
!77 = !DILocation(line: 104, column: 5, scope: !63)
!78 = !DILocation(line: 107, column: 5, scope: !63)
!79 = !DILocation(line: 108, column: 5, scope: !63)
!80 = !DILocation(line: 109, column: 5, scope: !63)
!81 = !DILocation(line: 111, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 61, type: !16)
!84 = !DILocation(line: 61, column: 12, scope: !82)
!85 = !DILocalVariable(name: "myUnion", scope: !82, file: !12, line: 62, type: !20)
!86 = !DILocation(line: 62, column: 81, scope: !82)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !12, line: 63, type: !27)
!88 = !DILocation(line: 63, column: 10, scope: !82)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !12, line: 64, type: !32)
!90 = !DILocation(line: 64, column: 10, scope: !82)
!91 = !DILocation(line: 66, column: 12, scope: !82)
!92 = !DILocation(line: 66, column: 10, scope: !82)
!93 = !DILocation(line: 67, column: 5, scope: !82)
!94 = !DILocation(line: 67, column: 13, scope: !82)
!95 = !DILocation(line: 68, column: 26, scope: !82)
!96 = !DILocation(line: 68, column: 13, scope: !82)
!97 = !DILocation(line: 68, column: 24, scope: !82)
!98 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 70, type: !16)
!99 = distinct !DILexicalBlock(scope: !82, file: !12, line: 69, column: 5)
!100 = !DILocation(line: 70, column: 16, scope: !99)
!101 = !DILocation(line: 70, column: 31, scope: !99)
!102 = !DILocalVariable(name: "source", scope: !103, file: !12, line: 72, type: !32)
!103 = distinct !DILexicalBlock(scope: !99, file: !12, line: 71, column: 9)
!104 = !DILocation(line: 72, column: 18, scope: !103)
!105 = !DILocation(line: 73, column: 13, scope: !103)
!106 = !DILocation(line: 74, column: 13, scope: !103)
!107 = !DILocation(line: 74, column: 27, scope: !103)
!108 = !DILocation(line: 76, column: 20, scope: !103)
!109 = !DILocation(line: 76, column: 13, scope: !103)
!110 = !DILocation(line: 77, column: 13, scope: !103)
!111 = !DILocation(line: 77, column: 25, scope: !103)
!112 = !DILocation(line: 78, column: 23, scope: !103)
!113 = !DILocation(line: 78, column: 13, scope: !103)
!114 = !DILocation(line: 81, column: 1, scope: !82)
