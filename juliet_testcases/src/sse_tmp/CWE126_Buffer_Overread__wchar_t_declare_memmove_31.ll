; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data5 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !32
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !36
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay4, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !41, metadata !DIExpression()), !dbg !43
  %0 = load i32*, i32** %data, align 8, !dbg !44
  store i32* %0, i32** %dataCopy, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !45, metadata !DIExpression()), !dbg !46
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !47
  store i32* %1, i32** %data5, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !50
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #6, !dbg !52
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx8, align 4, !dbg !54
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %2 = bitcast i32* %arraydecay9 to i8*, !dbg !55
  %3 = load i32*, i32** %data5, align 8, !dbg !56
  %4 = bitcast i32* %3 to i8*, !dbg !55
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call11 = call i64 @wcslen(i32* %arraydecay10) #7, !dbg !58
  %mul = mul i64 %call11, 4, !dbg !59
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %2, i8* align 4 %4, i64 %mul, i1 false), !dbg !55
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx12, align 4, !dbg !61
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* %arraydecay13), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_31_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_31_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_31_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data5 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !95
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !96
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !100
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx3, align 4, !dbg !102
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  store i32* %arraydecay4, i32** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !105, metadata !DIExpression()), !dbg !107
  %0 = load i32*, i32** %data, align 8, !dbg !108
  store i32* %0, i32** %dataCopy, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !109, metadata !DIExpression()), !dbg !110
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !111
  store i32* %1, i32** %data5, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !115
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #6, !dbg !116
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !117
  store i32 0, i32* %arrayidx8, align 4, !dbg !118
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %2 = bitcast i32* %arraydecay9 to i8*, !dbg !119
  %3 = load i32*, i32** %data5, align 8, !dbg !120
  %4 = bitcast i32* %3 to i8*, !dbg !119
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !121
  %call11 = call i64 @wcslen(i32* %arraydecay10) #7, !dbg !122
  %mul = mul i64 %call11, 4, !dbg !123
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %2, i8* align 4 %4, i64 %mul, i1 false), !dbg !119
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx12, align 4, !dbg !125
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  call void @printWLine(i32* %arraydecay13), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 5, scope: !11)
!33 = !DILocation(line: 29, column: 5, scope: !11)
!34 = !DILocation(line: 29, column: 25, scope: !11)
!35 = !DILocation(line: 30, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 27, scope: !11)
!39 = !DILocation(line: 33, column: 12, scope: !11)
!40 = !DILocation(line: 33, column: 10, scope: !11)
!41 = !DILocalVariable(name: "dataCopy", scope: !42, file: !12, line: 35, type: !16)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!43 = !DILocation(line: 35, column: 19, scope: !42)
!44 = !DILocation(line: 35, column: 30, scope: !42)
!45 = !DILocalVariable(name: "data", scope: !42, file: !12, line: 36, type: !16)
!46 = !DILocation(line: 36, column: 19, scope: !42)
!47 = !DILocation(line: 36, column: 26, scope: !42)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 38, type: !27)
!49 = distinct !DILexicalBlock(scope: !42, file: !12, line: 37, column: 9)
!50 = !DILocation(line: 38, column: 21, scope: !49)
!51 = !DILocation(line: 39, column: 21, scope: !49)
!52 = !DILocation(line: 39, column: 13, scope: !49)
!53 = !DILocation(line: 40, column: 13, scope: !49)
!54 = !DILocation(line: 40, column: 25, scope: !49)
!55 = !DILocation(line: 43, column: 13, scope: !49)
!56 = !DILocation(line: 43, column: 27, scope: !49)
!57 = !DILocation(line: 43, column: 40, scope: !49)
!58 = !DILocation(line: 43, column: 33, scope: !49)
!59 = !DILocation(line: 43, column: 45, scope: !49)
!60 = !DILocation(line: 44, column: 13, scope: !49)
!61 = !DILocation(line: 44, column: 25, scope: !49)
!62 = !DILocation(line: 45, column: 24, scope: !49)
!63 = !DILocation(line: 45, column: 13, scope: !49)
!64 = !DILocation(line: 48, column: 1, scope: !11)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_31_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 84, column: 5, scope: !65)
!67 = !DILocation(line: 85, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !69, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!19, !19, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 96, type: !19)
!75 = !DILocation(line: 96, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 96, type: !71)
!77 = !DILocation(line: 96, column: 27, scope: !68)
!78 = !DILocation(line: 99, column: 22, scope: !68)
!79 = !DILocation(line: 99, column: 12, scope: !68)
!80 = !DILocation(line: 99, column: 5, scope: !68)
!81 = !DILocation(line: 101, column: 5, scope: !68)
!82 = !DILocation(line: 102, column: 5, scope: !68)
!83 = !DILocation(line: 103, column: 5, scope: !68)
!84 = !DILocation(line: 106, column: 5, scope: !68)
!85 = !DILocation(line: 107, column: 5, scope: !68)
!86 = !DILocation(line: 108, column: 5, scope: !68)
!87 = !DILocation(line: 110, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 57, type: !16)
!90 = !DILocation(line: 57, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !12, line: 58, type: !22)
!92 = !DILocation(line: 58, column: 13, scope: !88)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !12, line: 59, type: !27)
!94 = !DILocation(line: 59, column: 13, scope: !88)
!95 = !DILocation(line: 60, column: 13, scope: !88)
!96 = !DILocation(line: 60, column: 5, scope: !88)
!97 = !DILocation(line: 61, column: 5, scope: !88)
!98 = !DILocation(line: 61, column: 25, scope: !88)
!99 = !DILocation(line: 62, column: 13, scope: !88)
!100 = !DILocation(line: 62, column: 5, scope: !88)
!101 = !DILocation(line: 63, column: 5, scope: !88)
!102 = !DILocation(line: 63, column: 27, scope: !88)
!103 = !DILocation(line: 65, column: 12, scope: !88)
!104 = !DILocation(line: 65, column: 10, scope: !88)
!105 = !DILocalVariable(name: "dataCopy", scope: !106, file: !12, line: 67, type: !16)
!106 = distinct !DILexicalBlock(scope: !88, file: !12, line: 66, column: 5)
!107 = !DILocation(line: 67, column: 19, scope: !106)
!108 = !DILocation(line: 67, column: 30, scope: !106)
!109 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 68, type: !16)
!110 = !DILocation(line: 68, column: 19, scope: !106)
!111 = !DILocation(line: 68, column: 26, scope: !106)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !12, line: 70, type: !27)
!113 = distinct !DILexicalBlock(scope: !106, file: !12, line: 69, column: 9)
!114 = !DILocation(line: 70, column: 21, scope: !113)
!115 = !DILocation(line: 71, column: 21, scope: !113)
!116 = !DILocation(line: 71, column: 13, scope: !113)
!117 = !DILocation(line: 72, column: 13, scope: !113)
!118 = !DILocation(line: 72, column: 25, scope: !113)
!119 = !DILocation(line: 75, column: 13, scope: !113)
!120 = !DILocation(line: 75, column: 27, scope: !113)
!121 = !DILocation(line: 75, column: 40, scope: !113)
!122 = !DILocation(line: 75, column: 33, scope: !113)
!123 = !DILocation(line: 75, column: 45, scope: !113)
!124 = !DILocation(line: 76, column: 13, scope: !113)
!125 = !DILocation(line: 76, column: 25, scope: !113)
!126 = !DILocation(line: 77, column: 24, scope: !113)
!127 = !DILocation(line: 77, column: 13, scope: !113)
!128 = !DILocation(line: 80, column: 1, scope: !88)
