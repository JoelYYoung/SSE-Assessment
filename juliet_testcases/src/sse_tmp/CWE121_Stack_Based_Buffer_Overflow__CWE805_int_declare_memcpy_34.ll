; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_unionType* %myUnion to i32**, !dbg !39
  store i32* %0, i32** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_unionType* %myUnion to i32**, !dbg !44
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !44
  store i32* %1, i32** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !47
  %3 = load i32*, i32** %data1, align 8, !dbg !48
  %4 = bitcast i32* %3 to i8*, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %5 = bitcast i32* %arraydecay2 to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !49
  %6 = load i32*, i32** %data1, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !50
  %7 = load i32, i32* %arrayidx, align 4, !dbg !50
  call void @printIntLine(i32 %7), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_unionType* %myUnion, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !85
  store i32* %arraydecay, i32** %data, align 8, !dbg !86
  %0 = load i32*, i32** %data, align 8, !dbg !87
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_unionType* %myUnion to i32**, !dbg !88
  store i32* %0, i32** %unionFirst, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !90, metadata !DIExpression()), !dbg !92
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_unionType* %myUnion to i32**, !dbg !93
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !93
  store i32* %1, i32** %data1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !96
  %3 = load i32*, i32** %data1, align 8, !dbg !97
  %4 = bitcast i32* %3 to i8*, !dbg !98
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !98
  %5 = bitcast i32* %arraydecay2 to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !98
  %6 = load i32*, i32** %data1, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !99
  %7 = load i32, i32* %arrayidx, align 4, !dbg !99
  call void @printIntLine(i32 %7), !dbg !100
  ret void, !dbg !101
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 29, column: 11, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 30, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_unionType", file: !12, line: 23, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 19, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 21, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 22, baseType: !16, size: 64)
!25 = !DILocation(line: 30, column: 80, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 31, column: 9, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 32, column: 9, scope: !11)
!36 = !DILocation(line: 35, column: 12, scope: !11)
!37 = !DILocation(line: 35, column: 10, scope: !11)
!38 = !DILocation(line: 36, column: 26, scope: !11)
!39 = !DILocation(line: 36, column: 13, scope: !11)
!40 = !DILocation(line: 36, column: 24, scope: !11)
!41 = !DILocalVariable(name: "data", scope: !42, file: !12, line: 38, type: !16)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!43 = !DILocation(line: 38, column: 15, scope: !42)
!44 = !DILocation(line: 38, column: 30, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !12, line: 40, type: !32)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 39, column: 9)
!47 = !DILocation(line: 40, column: 17, scope: !46)
!48 = !DILocation(line: 42, column: 20, scope: !46)
!49 = !DILocation(line: 42, column: 13, scope: !46)
!50 = !DILocation(line: 43, column: 26, scope: !46)
!51 = !DILocation(line: 43, column: 13, scope: !46)
!52 = !DILocation(line: 46, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_34_good", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 75, column: 5, scope: !53)
!55 = !DILocation(line: 76, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !57, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!17, !17, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 87, type: !17)
!63 = !DILocation(line: 87, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 87, type: !59)
!65 = !DILocation(line: 87, column: 27, scope: !56)
!66 = !DILocation(line: 90, column: 22, scope: !56)
!67 = !DILocation(line: 90, column: 12, scope: !56)
!68 = !DILocation(line: 90, column: 5, scope: !56)
!69 = !DILocation(line: 92, column: 5, scope: !56)
!70 = !DILocation(line: 93, column: 5, scope: !56)
!71 = !DILocation(line: 94, column: 5, scope: !56)
!72 = !DILocation(line: 97, column: 5, scope: !56)
!73 = !DILocation(line: 98, column: 5, scope: !56)
!74 = !DILocation(line: 99, column: 5, scope: !56)
!75 = !DILocation(line: 101, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 55, type: !16)
!78 = !DILocation(line: 55, column: 11, scope: !76)
!79 = !DILocalVariable(name: "myUnion", scope: !76, file: !12, line: 56, type: !20)
!80 = !DILocation(line: 56, column: 80, scope: !76)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !12, line: 57, type: !27)
!82 = !DILocation(line: 57, column: 9, scope: !76)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !12, line: 58, type: !32)
!84 = !DILocation(line: 58, column: 9, scope: !76)
!85 = !DILocation(line: 60, column: 12, scope: !76)
!86 = !DILocation(line: 60, column: 10, scope: !76)
!87 = !DILocation(line: 61, column: 26, scope: !76)
!88 = !DILocation(line: 61, column: 13, scope: !76)
!89 = !DILocation(line: 61, column: 24, scope: !76)
!90 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 63, type: !16)
!91 = distinct !DILexicalBlock(scope: !76, file: !12, line: 62, column: 5)
!92 = !DILocation(line: 63, column: 15, scope: !91)
!93 = !DILocation(line: 63, column: 30, scope: !91)
!94 = !DILocalVariable(name: "source", scope: !95, file: !12, line: 65, type: !32)
!95 = distinct !DILexicalBlock(scope: !91, file: !12, line: 64, column: 9)
!96 = !DILocation(line: 65, column: 17, scope: !95)
!97 = !DILocation(line: 67, column: 20, scope: !95)
!98 = !DILocation(line: 67, column: 13, scope: !95)
!99 = !DILocation(line: 68, column: 26, scope: !95)
!100 = !DILocation(line: 68, column: 13, scope: !95)
!101 = !DILocation(line: 71, column: 1, scope: !76)
