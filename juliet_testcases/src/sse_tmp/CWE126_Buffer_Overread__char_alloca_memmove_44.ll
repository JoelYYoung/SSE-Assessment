; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !31
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !35
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !38
  store i8* %6, i8** %data, align 8, !dbg !39
  %7 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !40
  %8 = load i8*, i8** %data, align 8, !dbg !41
  call void %7(i8* %8), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %0 = load i8*, i8** %data.addr, align 8, !dbg !56
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  %call = call i64 @strlen(i8* %arraydecay2) #7, !dbg !58
  %mul = mul i64 %call, 1, !dbg !59
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 %mul, i1 false), !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx3, align 1, !dbg !61
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  call void @printLine(i8* %arraydecay4), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_44_good() #0 !dbg !65 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #8, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #8, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__char_alloca_memmove_44_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__char_alloca_memmove_44_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !90, metadata !DIExpression()), !dbg !91
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 50, align 16, !dbg !94
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %1 = alloca i8, i64 100, align 16, !dbg !97
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !96
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !99
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !103
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !104
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !104
  store i8 0, i8* %arrayidx1, align 1, !dbg !105
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !106
  store i8* %6, i8** %data, align 8, !dbg !107
  %7 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !108
  %8 = load i8*, i8** %data, align 8, !dbg !109
  call void %7(i8* %8), !dbg !108
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !111 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !117
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !120
  %0 = load i8*, i8** %data.addr, align 8, !dbg !121
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !122
  %call = call i64 @strlen(i8* %arraydecay2) #7, !dbg !123
  %mul = mul i64 %call, 1, !dbg !124
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 %mul, i1 false), !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx3, align 1, !dbg !126
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  call void @printLine(i8* %arraydecay4), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_44_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 41, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 41, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 42, type: !4)
!25 = !DILocation(line: 42, column: 12, scope: !13)
!26 = !DILocation(line: 42, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 43, type: !4)
!28 = !DILocation(line: 43, column: 12, scope: !13)
!29 = !DILocation(line: 43, column: 37, scope: !13)
!30 = !DILocation(line: 44, column: 12, scope: !13)
!31 = !DILocation(line: 44, column: 5, scope: !13)
!32 = !DILocation(line: 45, column: 5, scope: !13)
!33 = !DILocation(line: 45, column: 25, scope: !13)
!34 = !DILocation(line: 46, column: 12, scope: !13)
!35 = !DILocation(line: 46, column: 5, scope: !13)
!36 = !DILocation(line: 47, column: 5, scope: !13)
!37 = !DILocation(line: 47, column: 27, scope: !13)
!38 = !DILocation(line: 49, column: 12, scope: !13)
!39 = !DILocation(line: 49, column: 10, scope: !13)
!40 = !DILocation(line: 51, column: 5, scope: !13)
!41 = !DILocation(line: 51, column: 13, scope: !13)
!42 = !DILocation(line: 52, column: 1, scope: !13)
!43 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !14, line: 23, type: !4)
!45 = !DILocation(line: 23, column: 28, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !14, line: 26, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !14, line: 25, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 26, column: 14, scope: !47)
!52 = !DILocation(line: 27, column: 9, scope: !47)
!53 = !DILocation(line: 28, column: 9, scope: !47)
!54 = !DILocation(line: 28, column: 21, scope: !47)
!55 = !DILocation(line: 31, column: 9, scope: !47)
!56 = !DILocation(line: 31, column: 23, scope: !47)
!57 = !DILocation(line: 31, column: 36, scope: !47)
!58 = !DILocation(line: 31, column: 29, scope: !47)
!59 = !DILocation(line: 31, column: 41, scope: !47)
!60 = !DILocation(line: 32, column: 9, scope: !47)
!61 = !DILocation(line: 32, column: 21, scope: !47)
!62 = !DILocation(line: 33, column: 19, scope: !47)
!63 = !DILocation(line: 33, column: 9, scope: !47)
!64 = !DILocation(line: 35, column: 1, scope: !43)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_44_good", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 90, column: 5, scope: !65)
!67 = !DILocation(line: 91, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 102, type: !69, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !72}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !14, line: 102, type: !71)
!74 = !DILocation(line: 102, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !14, line: 102, type: !72)
!76 = !DILocation(line: 102, column: 27, scope: !68)
!77 = !DILocation(line: 105, column: 22, scope: !68)
!78 = !DILocation(line: 105, column: 12, scope: !68)
!79 = !DILocation(line: 105, column: 5, scope: !68)
!80 = !DILocation(line: 107, column: 5, scope: !68)
!81 = !DILocation(line: 108, column: 5, scope: !68)
!82 = !DILocation(line: 109, column: 5, scope: !68)
!83 = !DILocation(line: 112, column: 5, scope: !68)
!84 = !DILocation(line: 113, column: 5, scope: !68)
!85 = !DILocation(line: 114, column: 5, scope: !68)
!86 = !DILocation(line: 116, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !14, line: 75, type: !4)
!89 = !DILocation(line: 75, column: 12, scope: !87)
!90 = !DILocalVariable(name: "funcPtr", scope: !87, file: !14, line: 76, type: !20)
!91 = !DILocation(line: 76, column: 12, scope: !87)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !14, line: 77, type: !4)
!93 = !DILocation(line: 77, column: 12, scope: !87)
!94 = !DILocation(line: 77, column: 36, scope: !87)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !14, line: 78, type: !4)
!96 = !DILocation(line: 78, column: 12, scope: !87)
!97 = !DILocation(line: 78, column: 37, scope: !87)
!98 = !DILocation(line: 79, column: 12, scope: !87)
!99 = !DILocation(line: 79, column: 5, scope: !87)
!100 = !DILocation(line: 80, column: 5, scope: !87)
!101 = !DILocation(line: 80, column: 25, scope: !87)
!102 = !DILocation(line: 81, column: 12, scope: !87)
!103 = !DILocation(line: 81, column: 5, scope: !87)
!104 = !DILocation(line: 82, column: 5, scope: !87)
!105 = !DILocation(line: 82, column: 27, scope: !87)
!106 = !DILocation(line: 84, column: 12, scope: !87)
!107 = !DILocation(line: 84, column: 10, scope: !87)
!108 = !DILocation(line: 85, column: 5, scope: !87)
!109 = !DILocation(line: 85, column: 13, scope: !87)
!110 = !DILocation(line: 86, column: 1, scope: !87)
!111 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 59, type: !21, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", arg: 1, scope: !111, file: !14, line: 59, type: !4)
!113 = !DILocation(line: 59, column: 32, scope: !111)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !14, line: 62, type: !48)
!115 = distinct !DILexicalBlock(scope: !111, file: !14, line: 61, column: 5)
!116 = !DILocation(line: 62, column: 14, scope: !115)
!117 = !DILocation(line: 63, column: 9, scope: !115)
!118 = !DILocation(line: 64, column: 9, scope: !115)
!119 = !DILocation(line: 64, column: 21, scope: !115)
!120 = !DILocation(line: 67, column: 9, scope: !115)
!121 = !DILocation(line: 67, column: 23, scope: !115)
!122 = !DILocation(line: 67, column: 36, scope: !115)
!123 = !DILocation(line: 67, column: 29, scope: !115)
!124 = !DILocation(line: 67, column: 41, scope: !115)
!125 = !DILocation(line: 68, column: 9, scope: !115)
!126 = !DILocation(line: 68, column: 21, scope: !115)
!127 = !DILocation(line: 69, column: 19, scope: !115)
!128 = !DILocation(line: 69, column: 9, scope: !115)
!129 = !DILocation(line: 71, column: 1, scope: !111)
