; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15_bad.source to i8*), i64 44, i1 false), !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %3 = bitcast i32* %2 to i8*, !dbg !39
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !39
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !39
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !40
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !41
  %add = add i64 %call, 1, !dbg !42
  %mul = mul i64 %add, 4, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !39
  %5 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %5), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !78
  store i32* %arraydecay, i32** %data, align 8, !dbg !79
  %0 = load i32*, i32** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !84
  %2 = load i32*, i32** %data, align 8, !dbg !85
  %3 = bitcast i32* %2 to i8*, !dbg !86
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !86
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !86
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !87
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !88
  %add = add i64 %call, 1, !dbg !89
  %mul = mul i64 %add, 4, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !86
  %5 = load i32*, i32** %data, align 8, !dbg !91
  call void @printWLine(i32* %5), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i32* %arraydecay, i32** %data, align 8, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !107
  %2 = load i32*, i32** %data, align 8, !dbg !108
  %3 = bitcast i32* %2 to i8*, !dbg !109
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !109
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !109
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !110
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !111
  %add = add i64 %call, 1, !dbg !112
  %mul = mul i64 %add, 4, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !109
  %5 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* %5), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 38, column: 16, scope: !11)
!32 = !DILocation(line: 38, column: 14, scope: !11)
!33 = !DILocation(line: 39, column: 9, scope: !11)
!34 = !DILocation(line: 39, column: 17, scope: !11)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 47, type: !27)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!37 = !DILocation(line: 47, column: 17, scope: !36)
!38 = !DILocation(line: 50, column: 16, scope: !36)
!39 = !DILocation(line: 50, column: 9, scope: !36)
!40 = !DILocation(line: 50, column: 38, scope: !36)
!41 = !DILocation(line: 50, column: 31, scope: !36)
!42 = !DILocation(line: 50, column: 46, scope: !36)
!43 = !DILocation(line: 50, column: 51, scope: !36)
!44 = !DILocation(line: 51, column: 20, scope: !36)
!45 = !DILocation(line: 51, column: 9, scope: !36)
!46 = !DILocation(line: 53, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_15_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 117, column: 5, scope: !47)
!49 = !DILocation(line: 118, column: 5, scope: !47)
!50 = !DILocation(line: 119, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !52, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!19, !19, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 131, type: !19)
!58 = !DILocation(line: 131, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 131, type: !54)
!60 = !DILocation(line: 131, column: 27, scope: !51)
!61 = !DILocation(line: 134, column: 22, scope: !51)
!62 = !DILocation(line: 134, column: 12, scope: !51)
!63 = !DILocation(line: 134, column: 5, scope: !51)
!64 = !DILocation(line: 136, column: 5, scope: !51)
!65 = !DILocation(line: 137, column: 5, scope: !51)
!66 = !DILocation(line: 138, column: 5, scope: !51)
!67 = !DILocation(line: 141, column: 5, scope: !51)
!68 = !DILocation(line: 142, column: 5, scope: !51)
!69 = !DILocation(line: 143, column: 5, scope: !51)
!70 = !DILocation(line: 145, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 62, type: !16)
!73 = !DILocation(line: 62, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !12, line: 63, type: !22)
!75 = !DILocation(line: 63, column: 13, scope: !71)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !12, line: 64, type: !27)
!77 = !DILocation(line: 64, column: 13, scope: !71)
!78 = !DILocation(line: 74, column: 16, scope: !71)
!79 = !DILocation(line: 74, column: 14, scope: !71)
!80 = !DILocation(line: 75, column: 9, scope: !71)
!81 = !DILocation(line: 75, column: 17, scope: !71)
!82 = !DILocalVariable(name: "source", scope: !83, file: !12, line: 79, type: !27)
!83 = distinct !DILexicalBlock(scope: !71, file: !12, line: 78, column: 5)
!84 = !DILocation(line: 79, column: 17, scope: !83)
!85 = !DILocation(line: 82, column: 16, scope: !83)
!86 = !DILocation(line: 82, column: 9, scope: !83)
!87 = !DILocation(line: 82, column: 38, scope: !83)
!88 = !DILocation(line: 82, column: 31, scope: !83)
!89 = !DILocation(line: 82, column: 46, scope: !83)
!90 = !DILocation(line: 82, column: 51, scope: !83)
!91 = !DILocation(line: 83, column: 20, scope: !83)
!92 = !DILocation(line: 83, column: 9, scope: !83)
!93 = !DILocation(line: 85, column: 1, scope: !71)
!94 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 90, type: !16)
!96 = !DILocation(line: 90, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !12, line: 91, type: !22)
!98 = !DILocation(line: 91, column: 13, scope: !94)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !12, line: 92, type: !27)
!100 = !DILocation(line: 92, column: 13, scope: !94)
!101 = !DILocation(line: 98, column: 16, scope: !94)
!102 = !DILocation(line: 98, column: 14, scope: !94)
!103 = !DILocation(line: 99, column: 9, scope: !94)
!104 = !DILocation(line: 99, column: 17, scope: !94)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 107, type: !27)
!106 = distinct !DILexicalBlock(scope: !94, file: !12, line: 106, column: 5)
!107 = !DILocation(line: 107, column: 17, scope: !106)
!108 = !DILocation(line: 110, column: 16, scope: !106)
!109 = !DILocation(line: 110, column: 9, scope: !106)
!110 = !DILocation(line: 110, column: 38, scope: !106)
!111 = !DILocation(line: 110, column: 31, scope: !106)
!112 = !DILocation(line: 110, column: 46, scope: !106)
!113 = !DILocation(line: 110, column: 51, scope: !106)
!114 = !DILocation(line: 111, column: 20, scope: !106)
!115 = !DILocation(line: 111, column: 9, scope: !106)
!116 = !DILocation(line: 113, column: 1, scope: !94)
