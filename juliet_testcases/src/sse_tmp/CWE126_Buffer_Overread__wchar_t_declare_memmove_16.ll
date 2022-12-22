; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_16.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_16_bad() #0 !dbg !11 {
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
  br label %while.body, !dbg !39

while.body:                                       ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i32* %arraydecay4, i32** %data, align 8, !dbg !42
  br label %while.end, !dbg !43

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !48
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx7, align 4, !dbg !50
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !51
  %1 = load i32*, i32** %data, align 8, !dbg !52
  %2 = bitcast i32* %1 to i8*, !dbg !51
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !54
  %mul = mul i64 %call10, 4, !dbg !55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !51
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx11, align 4, !dbg !57
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay12), !dbg !59
  ret void, !dbg !60
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_16_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #6, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #6, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_16_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_16_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !91
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !92
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !95
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !96
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx3, align 4, !dbg !98
  br label %while.body, !dbg !99

while.body:                                       ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  store i32* %arraydecay4, i32** %data, align 8, !dbg !102
  br label %while.end, !dbg !103

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !107
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !108
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx7, align 4, !dbg !110
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !111
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !111
  %1 = load i32*, i32** %data, align 8, !dbg !112
  %2 = bitcast i32* %1 to i8*, !dbg !111
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !114
  %mul = mul i64 %call10, 4, !dbg !115
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !111
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx11, align 4, !dbg !117
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  call void @printWLine(i32* %arraydecay12), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_16_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_16.c", directory: "/root/SSE-Assessment")
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
!39 = !DILocation(line: 32, column: 5, scope: !11)
!40 = !DILocation(line: 35, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!42 = !DILocation(line: 35, column: 14, scope: !41)
!43 = !DILocation(line: 36, column: 9, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 39, type: !27)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!46 = !DILocation(line: 39, column: 17, scope: !45)
!47 = !DILocation(line: 40, column: 17, scope: !45)
!48 = !DILocation(line: 40, column: 9, scope: !45)
!49 = !DILocation(line: 41, column: 9, scope: !45)
!50 = !DILocation(line: 41, column: 21, scope: !45)
!51 = !DILocation(line: 44, column: 9, scope: !45)
!52 = !DILocation(line: 44, column: 23, scope: !45)
!53 = !DILocation(line: 44, column: 36, scope: !45)
!54 = !DILocation(line: 44, column: 29, scope: !45)
!55 = !DILocation(line: 44, column: 41, scope: !45)
!56 = !DILocation(line: 45, column: 9, scope: !45)
!57 = !DILocation(line: 45, column: 21, scope: !45)
!58 = !DILocation(line: 46, column: 20, scope: !45)
!59 = !DILocation(line: 46, column: 9, scope: !45)
!60 = !DILocation(line: 48, column: 1, scope: !11)
!61 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_16_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 84, column: 5, scope: !61)
!63 = !DILocation(line: 85, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !65, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!19, !19, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !12, line: 97, type: !19)
!71 = !DILocation(line: 97, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !12, line: 97, type: !67)
!73 = !DILocation(line: 97, column: 27, scope: !64)
!74 = !DILocation(line: 100, column: 22, scope: !64)
!75 = !DILocation(line: 100, column: 12, scope: !64)
!76 = !DILocation(line: 100, column: 5, scope: !64)
!77 = !DILocation(line: 102, column: 5, scope: !64)
!78 = !DILocation(line: 103, column: 5, scope: !64)
!79 = !DILocation(line: 104, column: 5, scope: !64)
!80 = !DILocation(line: 107, column: 5, scope: !64)
!81 = !DILocation(line: 108, column: 5, scope: !64)
!82 = !DILocation(line: 109, column: 5, scope: !64)
!83 = !DILocation(line: 111, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 57, type: !16)
!86 = !DILocation(line: 57, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !12, line: 58, type: !22)
!88 = !DILocation(line: 58, column: 13, scope: !84)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !12, line: 59, type: !27)
!90 = !DILocation(line: 59, column: 13, scope: !84)
!91 = !DILocation(line: 60, column: 13, scope: !84)
!92 = !DILocation(line: 60, column: 5, scope: !84)
!93 = !DILocation(line: 61, column: 5, scope: !84)
!94 = !DILocation(line: 61, column: 25, scope: !84)
!95 = !DILocation(line: 62, column: 13, scope: !84)
!96 = !DILocation(line: 62, column: 5, scope: !84)
!97 = !DILocation(line: 63, column: 5, scope: !84)
!98 = !DILocation(line: 63, column: 27, scope: !84)
!99 = !DILocation(line: 64, column: 5, scope: !84)
!100 = !DILocation(line: 67, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !84, file: !12, line: 65, column: 5)
!102 = !DILocation(line: 67, column: 14, scope: !101)
!103 = !DILocation(line: 68, column: 9, scope: !101)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !12, line: 71, type: !27)
!105 = distinct !DILexicalBlock(scope: !84, file: !12, line: 70, column: 5)
!106 = !DILocation(line: 71, column: 17, scope: !105)
!107 = !DILocation(line: 72, column: 17, scope: !105)
!108 = !DILocation(line: 72, column: 9, scope: !105)
!109 = !DILocation(line: 73, column: 9, scope: !105)
!110 = !DILocation(line: 73, column: 21, scope: !105)
!111 = !DILocation(line: 76, column: 9, scope: !105)
!112 = !DILocation(line: 76, column: 23, scope: !105)
!113 = !DILocation(line: 76, column: 36, scope: !105)
!114 = !DILocation(line: 76, column: 29, scope: !105)
!115 = !DILocation(line: 76, column: 41, scope: !105)
!116 = !DILocation(line: 77, column: 9, scope: !105)
!117 = !DILocation(line: 77, column: 21, scope: !105)
!118 = !DILocation(line: 78, column: 20, scope: !105)
!119 = !DILocation(line: 78, column: 9, scope: !105)
!120 = !DILocation(line: 80, column: 1, scope: !84)
