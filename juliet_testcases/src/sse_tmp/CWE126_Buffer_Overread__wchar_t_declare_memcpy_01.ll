; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !43
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !45
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx7, align 4, !dbg !47
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !48
  %1 = load i32*, i32** %data, align 8, !dbg !49
  %2 = bitcast i32* %1 to i8*, !dbg !48
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !51
  %mul = mul i64 %call10, 4, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !48
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx11, align 4, !dbg !54
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  call void @printWLine(i32* %arraydecay12), !dbg !56
  ret void, !dbg !57
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_01_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_01_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_01_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !88
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !89
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !93
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !94
  store i32 0, i32* %arrayidx3, align 4, !dbg !95
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay4, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !101
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !102
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx7, align 4, !dbg !104
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !105
  %1 = load i32*, i32** %data, align 8, !dbg !106
  %2 = bitcast i32* %1 to i8*, !dbg !105
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !107
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !108
  %mul = mul i64 %call10, 4, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !105
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx11, align 4, !dbg !111
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* %arraydecay12), !dbg !113
  ret void, !dbg !114
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_01.c", directory: "/root/SSE-Assessment")
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
!41 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 35, type: !27)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!43 = !DILocation(line: 35, column: 17, scope: !42)
!44 = !DILocation(line: 36, column: 17, scope: !42)
!45 = !DILocation(line: 36, column: 9, scope: !42)
!46 = !DILocation(line: 37, column: 9, scope: !42)
!47 = !DILocation(line: 37, column: 21, scope: !42)
!48 = !DILocation(line: 40, column: 9, scope: !42)
!49 = !DILocation(line: 40, column: 22, scope: !42)
!50 = !DILocation(line: 40, column: 35, scope: !42)
!51 = !DILocation(line: 40, column: 28, scope: !42)
!52 = !DILocation(line: 40, column: 40, scope: !42)
!53 = !DILocation(line: 41, column: 9, scope: !42)
!54 = !DILocation(line: 41, column: 21, scope: !42)
!55 = !DILocation(line: 42, column: 20, scope: !42)
!56 = !DILocation(line: 42, column: 9, scope: !42)
!57 = !DILocation(line: 44, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_01_good", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 76, column: 5, scope: !58)
!60 = !DILocation(line: 77, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !62, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!19, !19, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 89, type: !19)
!68 = !DILocation(line: 89, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 89, type: !64)
!70 = !DILocation(line: 89, column: 27, scope: !61)
!71 = !DILocation(line: 92, column: 22, scope: !61)
!72 = !DILocation(line: 92, column: 12, scope: !61)
!73 = !DILocation(line: 92, column: 5, scope: !61)
!74 = !DILocation(line: 94, column: 5, scope: !61)
!75 = !DILocation(line: 95, column: 5, scope: !61)
!76 = !DILocation(line: 96, column: 5, scope: !61)
!77 = !DILocation(line: 99, column: 5, scope: !61)
!78 = !DILocation(line: 100, column: 5, scope: !61)
!79 = !DILocation(line: 101, column: 5, scope: !61)
!80 = !DILocation(line: 103, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 53, type: !16)
!83 = !DILocation(line: 53, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !12, line: 54, type: !22)
!85 = !DILocation(line: 54, column: 13, scope: !81)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !12, line: 55, type: !27)
!87 = !DILocation(line: 55, column: 13, scope: !81)
!88 = !DILocation(line: 56, column: 13, scope: !81)
!89 = !DILocation(line: 56, column: 5, scope: !81)
!90 = !DILocation(line: 57, column: 5, scope: !81)
!91 = !DILocation(line: 57, column: 25, scope: !81)
!92 = !DILocation(line: 58, column: 13, scope: !81)
!93 = !DILocation(line: 58, column: 5, scope: !81)
!94 = !DILocation(line: 59, column: 5, scope: !81)
!95 = !DILocation(line: 59, column: 27, scope: !81)
!96 = !DILocation(line: 61, column: 12, scope: !81)
!97 = !DILocation(line: 61, column: 10, scope: !81)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !12, line: 63, type: !27)
!99 = distinct !DILexicalBlock(scope: !81, file: !12, line: 62, column: 5)
!100 = !DILocation(line: 63, column: 17, scope: !99)
!101 = !DILocation(line: 64, column: 17, scope: !99)
!102 = !DILocation(line: 64, column: 9, scope: !99)
!103 = !DILocation(line: 65, column: 9, scope: !99)
!104 = !DILocation(line: 65, column: 21, scope: !99)
!105 = !DILocation(line: 68, column: 9, scope: !99)
!106 = !DILocation(line: 68, column: 22, scope: !99)
!107 = !DILocation(line: 68, column: 35, scope: !99)
!108 = !DILocation(line: 68, column: 28, scope: !99)
!109 = !DILocation(line: 68, column: 40, scope: !99)
!110 = !DILocation(line: 69, column: 9, scope: !99)
!111 = !DILocation(line: 69, column: 21, scope: !99)
!112 = !DILocation(line: 70, column: 20, scope: !99)
!113 = !DILocation(line: 70, column: 9, scope: !99)
!114 = !DILocation(line: 72, column: 1, scope: !81)
