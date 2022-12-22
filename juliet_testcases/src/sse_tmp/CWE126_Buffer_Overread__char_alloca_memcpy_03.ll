; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_03.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_03_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %6, i8** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx2, align 1, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  %7 = load i8*, i8** %data, align 8, !dbg !47
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !49
  %mul = mul i64 %call, 1, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !46
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx5, align 1, !dbg !52
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @printLine(i8* %arraydecay6), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_03_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #8, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #8, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_03_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_03_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 50, align 16, !dbg !84
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %1 = alloca i8, i64 100, align 16, !dbg !87
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !86
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !89
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !93
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !94
  store i8 0, i8* %arrayidx1, align 1, !dbg !95
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !96
  store i8* %6, i8** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !103
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx2, align 1, !dbg !105
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  %7 = load i8*, i8** %data, align 8, !dbg !107
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !109
  %mul = mul i64 %call, 1, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !106
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx5, align 1, !dbg !112
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  call void @printLine(i8* %arraydecay6), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 50, align 16, !dbg !121
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %1 = alloca i8, i64 100, align 16, !dbg !124
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !123
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !126
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !130
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !131
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !131
  store i8 0, i8* %arrayidx1, align 1, !dbg !132
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !133
  store i8* %6, i8** %data, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !137, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx2, align 1, !dbg !142
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  %7 = load i8*, i8** %data, align 8, !dbg !144
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !146
  %mul = mul i64 %call, 1, !dbg !147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !143
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !148
  store i8 0, i8* %arrayidx5, align 1, !dbg !149
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  call void @printLine(i8* %arraydecay6), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_03.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_03_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_03.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 12, scope: !13)
!30 = !DILocation(line: 30, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 27, scope: !13)
!33 = !DILocation(line: 35, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !14, line: 33, column: 5)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!36 = !DILocation(line: 35, column: 14, scope: !34)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !14, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 38, column: 14, scope: !38)
!43 = !DILocation(line: 39, column: 9, scope: !38)
!44 = !DILocation(line: 40, column: 9, scope: !38)
!45 = !DILocation(line: 40, column: 21, scope: !38)
!46 = !DILocation(line: 43, column: 9, scope: !38)
!47 = !DILocation(line: 43, column: 22, scope: !38)
!48 = !DILocation(line: 43, column: 35, scope: !38)
!49 = !DILocation(line: 43, column: 28, scope: !38)
!50 = !DILocation(line: 43, column: 40, scope: !38)
!51 = !DILocation(line: 44, column: 9, scope: !38)
!52 = !DILocation(line: 44, column: 21, scope: !38)
!53 = !DILocation(line: 45, column: 19, scope: !38)
!54 = !DILocation(line: 45, column: 9, scope: !38)
!55 = !DILocation(line: 47, column: 1, scope: !13)
!56 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_03_good", scope: !14, file: !14, line: 112, type: !15, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 114, column: 5, scope: !56)
!58 = !DILocation(line: 115, column: 5, scope: !56)
!59 = !DILocation(line: 116, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 128, type: !61, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !14, line: 128, type: !63)
!66 = !DILocation(line: 128, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !14, line: 128, type: !64)
!68 = !DILocation(line: 128, column: 27, scope: !60)
!69 = !DILocation(line: 131, column: 22, scope: !60)
!70 = !DILocation(line: 131, column: 12, scope: !60)
!71 = !DILocation(line: 131, column: 5, scope: !60)
!72 = !DILocation(line: 133, column: 5, scope: !60)
!73 = !DILocation(line: 134, column: 5, scope: !60)
!74 = !DILocation(line: 135, column: 5, scope: !60)
!75 = !DILocation(line: 138, column: 5, scope: !60)
!76 = !DILocation(line: 139, column: 5, scope: !60)
!77 = !DILocation(line: 140, column: 5, scope: !60)
!78 = !DILocation(line: 142, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 56, type: !4)
!81 = !DILocation(line: 56, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !14, line: 57, type: !4)
!83 = !DILocation(line: 57, column: 12, scope: !79)
!84 = !DILocation(line: 57, column: 36, scope: !79)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !14, line: 58, type: !4)
!86 = !DILocation(line: 58, column: 12, scope: !79)
!87 = !DILocation(line: 58, column: 37, scope: !79)
!88 = !DILocation(line: 59, column: 12, scope: !79)
!89 = !DILocation(line: 59, column: 5, scope: !79)
!90 = !DILocation(line: 60, column: 5, scope: !79)
!91 = !DILocation(line: 60, column: 25, scope: !79)
!92 = !DILocation(line: 61, column: 12, scope: !79)
!93 = !DILocation(line: 61, column: 5, scope: !79)
!94 = !DILocation(line: 62, column: 5, scope: !79)
!95 = !DILocation(line: 62, column: 27, scope: !79)
!96 = !DILocation(line: 71, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !98, file: !14, line: 69, column: 5)
!98 = distinct !DILexicalBlock(scope: !79, file: !14, line: 63, column: 8)
!99 = !DILocation(line: 71, column: 14, scope: !97)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !14, line: 74, type: !39)
!101 = distinct !DILexicalBlock(scope: !79, file: !14, line: 73, column: 5)
!102 = !DILocation(line: 74, column: 14, scope: !101)
!103 = !DILocation(line: 75, column: 9, scope: !101)
!104 = !DILocation(line: 76, column: 9, scope: !101)
!105 = !DILocation(line: 76, column: 21, scope: !101)
!106 = !DILocation(line: 79, column: 9, scope: !101)
!107 = !DILocation(line: 79, column: 22, scope: !101)
!108 = !DILocation(line: 79, column: 35, scope: !101)
!109 = !DILocation(line: 79, column: 28, scope: !101)
!110 = !DILocation(line: 79, column: 40, scope: !101)
!111 = !DILocation(line: 80, column: 9, scope: !101)
!112 = !DILocation(line: 80, column: 21, scope: !101)
!113 = !DILocation(line: 81, column: 19, scope: !101)
!114 = !DILocation(line: 81, column: 9, scope: !101)
!115 = !DILocation(line: 83, column: 1, scope: !79)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !14, line: 88, type: !4)
!118 = !DILocation(line: 88, column: 12, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !14, line: 89, type: !4)
!120 = !DILocation(line: 89, column: 12, scope: !116)
!121 = !DILocation(line: 89, column: 36, scope: !116)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !14, line: 90, type: !4)
!123 = !DILocation(line: 90, column: 12, scope: !116)
!124 = !DILocation(line: 90, column: 37, scope: !116)
!125 = !DILocation(line: 91, column: 12, scope: !116)
!126 = !DILocation(line: 91, column: 5, scope: !116)
!127 = !DILocation(line: 92, column: 5, scope: !116)
!128 = !DILocation(line: 92, column: 25, scope: !116)
!129 = !DILocation(line: 93, column: 12, scope: !116)
!130 = !DILocation(line: 93, column: 5, scope: !116)
!131 = !DILocation(line: 94, column: 5, scope: !116)
!132 = !DILocation(line: 94, column: 27, scope: !116)
!133 = !DILocation(line: 98, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !135, file: !14, line: 96, column: 5)
!135 = distinct !DILexicalBlock(scope: !116, file: !14, line: 95, column: 8)
!136 = !DILocation(line: 98, column: 14, scope: !134)
!137 = !DILocalVariable(name: "dest", scope: !138, file: !14, line: 101, type: !39)
!138 = distinct !DILexicalBlock(scope: !116, file: !14, line: 100, column: 5)
!139 = !DILocation(line: 101, column: 14, scope: !138)
!140 = !DILocation(line: 102, column: 9, scope: !138)
!141 = !DILocation(line: 103, column: 9, scope: !138)
!142 = !DILocation(line: 103, column: 21, scope: !138)
!143 = !DILocation(line: 106, column: 9, scope: !138)
!144 = !DILocation(line: 106, column: 22, scope: !138)
!145 = !DILocation(line: 106, column: 35, scope: !138)
!146 = !DILocation(line: 106, column: 28, scope: !138)
!147 = !DILocation(line: 106, column: 40, scope: !138)
!148 = !DILocation(line: 107, column: 9, scope: !138)
!149 = !DILocation(line: 107, column: 21, scope: !138)
!150 = !DILocation(line: 108, column: 19, scope: !138)
!151 = !DILocation(line: 108, column: 9, scope: !138)
!152 = !DILocation(line: 110, column: 1, scope: !116)
