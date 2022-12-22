; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %1 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !40
  %2 = load i32*, i32** %data, align 8, !dbg !41
  call void %1(i32* %2), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !52
  %0 = load i32*, i32** %data.addr, align 8, !dbg !53
  %1 = bitcast i32* %0 to i8*, !dbg !54
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !54
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !54
  %3 = load i32*, i32** %data.addr, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !55
  store i32 0, i32* %arrayidx2, align 4, !dbg !56
  %4 = load i32*, i32** %data.addr, align 8, !dbg !57
  call void @printWLine(i32* %4), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_44_good() #0 !dbg !60 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_44_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_44_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !86, metadata !DIExpression()), !dbg !87
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  store i32* %arraydecay, i32** %data, align 8, !dbg !93
  %0 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  %1 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !96
  %2 = load i32*, i32** %data, align 8, !dbg !97
  call void %1(i32* %2), !dbg !96
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !99 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !106
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %0 = load i32*, i32** %data.addr, align 8, !dbg !109
  %1 = bitcast i32* %0 to i8*, !dbg !110
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !110
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !110
  %3 = load i32*, i32** %data.addr, align 8, !dbg !111
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !111
  store i32 0, i32* %arrayidx2, align 4, !dbg !112
  %4 = load i32*, i32** %data.addr, align 8, !dbg !113
  call void @printWLine(i32* %4), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_44_bad", scope: !12, file: !12, line: 36, type: !13, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 38, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 38, column: 15, scope: !11)
!21 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 40, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !16}
!25 = !DILocation(line: 40, column: 12, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 41, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 41, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 42, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 42, column: 13, scope: !11)
!36 = !DILocation(line: 45, column: 12, scope: !11)
!37 = !DILocation(line: 45, column: 10, scope: !11)
!38 = !DILocation(line: 46, column: 5, scope: !11)
!39 = !DILocation(line: 46, column: 13, scope: !11)
!40 = !DILocation(line: 48, column: 5, scope: !11)
!41 = !DILocation(line: 48, column: 13, scope: !11)
!42 = !DILocation(line: 49, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !12, line: 23, type: !16)
!45 = !DILocation(line: 23, column: 31, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !12, line: 26, type: !32)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 25, column: 5)
!48 = !DILocation(line: 26, column: 17, scope: !47)
!49 = !DILocation(line: 27, column: 17, scope: !47)
!50 = !DILocation(line: 27, column: 9, scope: !47)
!51 = !DILocation(line: 28, column: 9, scope: !47)
!52 = !DILocation(line: 28, column: 23, scope: !47)
!53 = !DILocation(line: 30, column: 17, scope: !47)
!54 = !DILocation(line: 30, column: 9, scope: !47)
!55 = !DILocation(line: 31, column: 9, scope: !47)
!56 = !DILocation(line: 31, column: 21, scope: !47)
!57 = !DILocation(line: 32, column: 20, scope: !47)
!58 = !DILocation(line: 32, column: 9, scope: !47)
!59 = !DILocation(line: 34, column: 1, scope: !43)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_44_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 83, column: 5, scope: !60)
!62 = !DILocation(line: 84, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 95, type: !64, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!19, !19, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 95, type: !19)
!70 = !DILocation(line: 95, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 95, type: !66)
!72 = !DILocation(line: 95, column: 27, scope: !63)
!73 = !DILocation(line: 98, column: 22, scope: !63)
!74 = !DILocation(line: 98, column: 12, scope: !63)
!75 = !DILocation(line: 98, column: 5, scope: !63)
!76 = !DILocation(line: 100, column: 5, scope: !63)
!77 = !DILocation(line: 101, column: 5, scope: !63)
!78 = !DILocation(line: 102, column: 5, scope: !63)
!79 = !DILocation(line: 105, column: 5, scope: !63)
!80 = !DILocation(line: 106, column: 5, scope: !63)
!81 = !DILocation(line: 107, column: 5, scope: !63)
!82 = !DILocation(line: 109, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 71, type: !16)
!85 = !DILocation(line: 71, column: 15, scope: !83)
!86 = !DILocalVariable(name: "funcPtr", scope: !83, file: !12, line: 72, type: !22)
!87 = !DILocation(line: 72, column: 12, scope: !83)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 73, type: !27)
!89 = !DILocation(line: 73, column: 13, scope: !83)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 74, type: !32)
!91 = !DILocation(line: 74, column: 13, scope: !83)
!92 = !DILocation(line: 76, column: 12, scope: !83)
!93 = !DILocation(line: 76, column: 10, scope: !83)
!94 = !DILocation(line: 77, column: 5, scope: !83)
!95 = !DILocation(line: 77, column: 13, scope: !83)
!96 = !DILocation(line: 78, column: 5, scope: !83)
!97 = !DILocation(line: 78, column: 13, scope: !83)
!98 = !DILocation(line: 79, column: 1, scope: !83)
!99 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 56, type: !23, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", arg: 1, scope: !99, file: !12, line: 56, type: !16)
!101 = !DILocation(line: 56, column: 35, scope: !99)
!102 = !DILocalVariable(name: "source", scope: !103, file: !12, line: 59, type: !32)
!103 = distinct !DILexicalBlock(scope: !99, file: !12, line: 58, column: 5)
!104 = !DILocation(line: 59, column: 17, scope: !103)
!105 = !DILocation(line: 60, column: 17, scope: !103)
!106 = !DILocation(line: 60, column: 9, scope: !103)
!107 = !DILocation(line: 61, column: 9, scope: !103)
!108 = !DILocation(line: 61, column: 23, scope: !103)
!109 = !DILocation(line: 63, column: 17, scope: !103)
!110 = !DILocation(line: 63, column: 9, scope: !103)
!111 = !DILocation(line: 64, column: 9, scope: !103)
!112 = !DILocation(line: 64, column: 21, scope: !103)
!113 = !DILocation(line: 65, column: 20, scope: !103)
!114 = !DILocation(line: 65, column: 9, scope: !103)
!115 = !DILocation(line: 67, column: 1, scope: !99)
