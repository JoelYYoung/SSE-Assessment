; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !27
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !28
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !31
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !31
  %1 = load i32*, i32** %data.addr, align 8, !dbg !32
  %2 = bitcast i32* %1 to i8*, !dbg !31
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !33
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !34
  %mul = mul i64 %call3, 4, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !31
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !36
  store i32 0, i32* %arrayidx4, align 4, !dbg !37
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  call void @printWLine(i32* %arraydecay5), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_bad() #0 !dbg !41 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !53
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !54
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !57
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx3, align 4, !dbg !60
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !61
  store i32* %arraydecay4, i32** %data, align 8, !dbg !62
  %0 = load i32*, i32** %data, align 8, !dbg !63
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_badSink(i32* %0), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_goodG2BSink(i32* %data) #0 !dbg !66 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !69, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !73
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !76
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !76
  %1 = load i32*, i32** %data.addr, align 8, !dbg !77
  %2 = bitcast i32* %1 to i8*, !dbg !76
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !78
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !79
  %mul = mul i64 %call3, 4, !dbg !80
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !76
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !81
  store i32 0, i32* %arrayidx4, align 4, !dbg !82
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !83
  call void @printWLine(i32* %arraydecay5), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #6, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #6, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !116
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !117
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !121
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx3, align 4, !dbg !123
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !124
  store i32* %arraydecay4, i32** %data, align 8, !dbg !125
  %0 = load i32*, i32** %data, align 8, !dbg !126
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_goodG2BSink(i32* %0), !dbg !127
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_41.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!20 = !DILocation(line: 23, column: 74, scope: !11)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !12, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocation(line: 27, column: 17, scope: !22)
!28 = !DILocation(line: 27, column: 9, scope: !22)
!29 = !DILocation(line: 28, column: 9, scope: !22)
!30 = !DILocation(line: 28, column: 21, scope: !22)
!31 = !DILocation(line: 31, column: 9, scope: !22)
!32 = !DILocation(line: 31, column: 22, scope: !22)
!33 = !DILocation(line: 31, column: 35, scope: !22)
!34 = !DILocation(line: 31, column: 28, scope: !22)
!35 = !DILocation(line: 31, column: 40, scope: !22)
!36 = !DILocation(line: 32, column: 9, scope: !22)
!37 = !DILocation(line: 32, column: 21, scope: !22)
!38 = !DILocation(line: 33, column: 20, scope: !22)
!39 = !DILocation(line: 33, column: 9, scope: !22)
!40 = !DILocation(line: 35, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_bad", scope: !12, file: !12, line: 37, type: !42, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null}
!44 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 39, type: !15)
!45 = !DILocation(line: 39, column: 15, scope: !41)
!46 = !DILocalVariable(name: "dataBadBuffer", scope: !41, file: !12, line: 40, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 40, column: 13, scope: !41)
!51 = !DILocalVariable(name: "dataGoodBuffer", scope: !41, file: !12, line: 41, type: !23)
!52 = !DILocation(line: 41, column: 13, scope: !41)
!53 = !DILocation(line: 42, column: 13, scope: !41)
!54 = !DILocation(line: 42, column: 5, scope: !41)
!55 = !DILocation(line: 43, column: 5, scope: !41)
!56 = !DILocation(line: 43, column: 25, scope: !41)
!57 = !DILocation(line: 44, column: 13, scope: !41)
!58 = !DILocation(line: 44, column: 5, scope: !41)
!59 = !DILocation(line: 45, column: 5, scope: !41)
!60 = !DILocation(line: 45, column: 27, scope: !41)
!61 = !DILocation(line: 47, column: 12, scope: !41)
!62 = !DILocation(line: 47, column: 10, scope: !41)
!63 = !DILocation(line: 48, column: 63, scope: !41)
!64 = !DILocation(line: 48, column: 5, scope: !41)
!65 = !DILocation(line: 49, column: 1, scope: !41)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_goodG2BSink", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", arg: 1, scope: !66, file: !12, line: 55, type: !15)
!68 = !DILocation(line: 55, column: 78, scope: !66)
!69 = !DILocalVariable(name: "dest", scope: !70, file: !12, line: 58, type: !23)
!70 = distinct !DILexicalBlock(scope: !66, file: !12, line: 57, column: 5)
!71 = !DILocation(line: 58, column: 17, scope: !70)
!72 = !DILocation(line: 59, column: 17, scope: !70)
!73 = !DILocation(line: 59, column: 9, scope: !70)
!74 = !DILocation(line: 60, column: 9, scope: !70)
!75 = !DILocation(line: 60, column: 21, scope: !70)
!76 = !DILocation(line: 63, column: 9, scope: !70)
!77 = !DILocation(line: 63, column: 22, scope: !70)
!78 = !DILocation(line: 63, column: 35, scope: !70)
!79 = !DILocation(line: 63, column: 28, scope: !70)
!80 = !DILocation(line: 63, column: 40, scope: !70)
!81 = !DILocation(line: 64, column: 9, scope: !70)
!82 = !DILocation(line: 64, column: 21, scope: !70)
!83 = !DILocation(line: 65, column: 20, scope: !70)
!84 = !DILocation(line: 65, column: 9, scope: !70)
!85 = !DILocation(line: 67, column: 1, scope: !66)
!86 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_41_good", scope: !12, file: !12, line: 84, type: !42, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 86, column: 5, scope: !86)
!88 = !DILocation(line: 87, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !90, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!18, !18, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !12, line: 99, type: !18)
!96 = !DILocation(line: 99, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !12, line: 99, type: !92)
!98 = !DILocation(line: 99, column: 27, scope: !89)
!99 = !DILocation(line: 102, column: 22, scope: !89)
!100 = !DILocation(line: 102, column: 12, scope: !89)
!101 = !DILocation(line: 102, column: 5, scope: !89)
!102 = !DILocation(line: 104, column: 5, scope: !89)
!103 = !DILocation(line: 105, column: 5, scope: !89)
!104 = !DILocation(line: 106, column: 5, scope: !89)
!105 = !DILocation(line: 109, column: 5, scope: !89)
!106 = !DILocation(line: 110, column: 5, scope: !89)
!107 = !DILocation(line: 111, column: 5, scope: !89)
!108 = !DILocation(line: 113, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 70, type: !42, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 72, type: !15)
!111 = !DILocation(line: 72, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !12, line: 73, type: !47)
!113 = !DILocation(line: 73, column: 13, scope: !109)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !12, line: 74, type: !23)
!115 = !DILocation(line: 74, column: 13, scope: !109)
!116 = !DILocation(line: 75, column: 13, scope: !109)
!117 = !DILocation(line: 75, column: 5, scope: !109)
!118 = !DILocation(line: 76, column: 5, scope: !109)
!119 = !DILocation(line: 76, column: 25, scope: !109)
!120 = !DILocation(line: 77, column: 13, scope: !109)
!121 = !DILocation(line: 77, column: 5, scope: !109)
!122 = !DILocation(line: 78, column: 5, scope: !109)
!123 = !DILocation(line: 78, column: 27, scope: !109)
!124 = !DILocation(line: 80, column: 12, scope: !109)
!125 = !DILocation(line: 80, column: 10, scope: !109)
!126 = !DILocation(line: 81, column: 67, scope: !109)
!127 = !DILocation(line: 81, column: 5, scope: !109)
!128 = !DILocation(line: 82, column: 1, scope: !109)
