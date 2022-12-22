; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_15_bad() #0 !dbg !13 {
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
  store i8* %6, i8** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx2, align 1, !dbg !43
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !47
  %mul = mul i64 %call, 1, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !44
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx5, align 1, !dbg !50
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @printLine(i8* %arraydecay6), !dbg !52
  ret void, !dbg !53
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
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_15_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #8, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #8, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_15_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_15_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 50, align 16, !dbg !82
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %1 = alloca i8, i64 100, align 16, !dbg !85
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !84
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !87
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !91
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !92
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !92
  store i8 0, i8* %arrayidx1, align 1, !dbg !93
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !94
  store i8* %6, i8** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx2, align 1, !dbg !101
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !102
  %7 = load i8*, i8** %data, align 8, !dbg !103
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !105
  %mul = mul i64 %call, 1, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !102
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx5, align 1, !dbg !108
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay6), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = alloca i8, i64 50, align 16, !dbg !117
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %1 = alloca i8, i64 100, align 16, !dbg !120
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !119
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !122
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !126
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !127
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !127
  store i8 0, i8* %arrayidx1, align 1, !dbg !128
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !129
  store i8* %6, i8** %data, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !131, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !134
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !135
  store i8 0, i8* %arrayidx2, align 1, !dbg !136
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !137
  %7 = load i8*, i8** %data, align 8, !dbg !138
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !140
  %mul = mul i64 %call, 1, !dbg !141
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !137
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx5, align 1, !dbg !143
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  call void @printLine(i8* %arraydecay6), !dbg !145
  ret void, !dbg !146
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_15.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_15.c", directory: "/root/SSE-Assessment")
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
!33 = !DILocation(line: 36, column: 16, scope: !13)
!34 = !DILocation(line: 36, column: 14, scope: !13)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 44, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 44, column: 14, scope: !36)
!41 = !DILocation(line: 45, column: 9, scope: !36)
!42 = !DILocation(line: 46, column: 9, scope: !36)
!43 = !DILocation(line: 46, column: 21, scope: !36)
!44 = !DILocation(line: 49, column: 9, scope: !36)
!45 = !DILocation(line: 49, column: 22, scope: !36)
!46 = !DILocation(line: 49, column: 35, scope: !36)
!47 = !DILocation(line: 49, column: 28, scope: !36)
!48 = !DILocation(line: 49, column: 40, scope: !36)
!49 = !DILocation(line: 50, column: 9, scope: !36)
!50 = !DILocation(line: 50, column: 21, scope: !36)
!51 = !DILocation(line: 51, column: 19, scope: !36)
!52 = !DILocation(line: 51, column: 9, scope: !36)
!53 = !DILocation(line: 53, column: 1, scope: !13)
!54 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_15_good", scope: !14, file: !14, line: 125, type: !15, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 127, column: 5, scope: !54)
!56 = !DILocation(line: 128, column: 5, scope: !54)
!57 = !DILocation(line: 129, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 141, type: !59, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !14, line: 141, type: !61)
!64 = !DILocation(line: 141, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !14, line: 141, type: !62)
!66 = !DILocation(line: 141, column: 27, scope: !58)
!67 = !DILocation(line: 144, column: 22, scope: !58)
!68 = !DILocation(line: 144, column: 12, scope: !58)
!69 = !DILocation(line: 144, column: 5, scope: !58)
!70 = !DILocation(line: 146, column: 5, scope: !58)
!71 = !DILocation(line: 147, column: 5, scope: !58)
!72 = !DILocation(line: 148, column: 5, scope: !58)
!73 = !DILocation(line: 151, column: 5, scope: !58)
!74 = !DILocation(line: 152, column: 5, scope: !58)
!75 = !DILocation(line: 153, column: 5, scope: !58)
!76 = !DILocation(line: 155, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !14, line: 62, type: !4)
!79 = !DILocation(line: 62, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !14, line: 63, type: !4)
!81 = !DILocation(line: 63, column: 12, scope: !77)
!82 = !DILocation(line: 63, column: 36, scope: !77)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !14, line: 64, type: !4)
!84 = !DILocation(line: 64, column: 12, scope: !77)
!85 = !DILocation(line: 64, column: 37, scope: !77)
!86 = !DILocation(line: 65, column: 12, scope: !77)
!87 = !DILocation(line: 65, column: 5, scope: !77)
!88 = !DILocation(line: 66, column: 5, scope: !77)
!89 = !DILocation(line: 66, column: 25, scope: !77)
!90 = !DILocation(line: 67, column: 12, scope: !77)
!91 = !DILocation(line: 67, column: 5, scope: !77)
!92 = !DILocation(line: 68, column: 5, scope: !77)
!93 = !DILocation(line: 68, column: 27, scope: !77)
!94 = !DILocation(line: 77, column: 16, scope: !77)
!95 = !DILocation(line: 77, column: 14, scope: !77)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !14, line: 81, type: !37)
!97 = distinct !DILexicalBlock(scope: !77, file: !14, line: 80, column: 5)
!98 = !DILocation(line: 81, column: 14, scope: !97)
!99 = !DILocation(line: 82, column: 9, scope: !97)
!100 = !DILocation(line: 83, column: 9, scope: !97)
!101 = !DILocation(line: 83, column: 21, scope: !97)
!102 = !DILocation(line: 86, column: 9, scope: !97)
!103 = !DILocation(line: 86, column: 22, scope: !97)
!104 = !DILocation(line: 86, column: 35, scope: !97)
!105 = !DILocation(line: 86, column: 28, scope: !97)
!106 = !DILocation(line: 86, column: 40, scope: !97)
!107 = !DILocation(line: 87, column: 9, scope: !97)
!108 = !DILocation(line: 87, column: 21, scope: !97)
!109 = !DILocation(line: 88, column: 19, scope: !97)
!110 = !DILocation(line: 88, column: 9, scope: !97)
!111 = !DILocation(line: 90, column: 1, scope: !77)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !14, line: 95, type: !4)
!114 = !DILocation(line: 95, column: 12, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !14, line: 96, type: !4)
!116 = !DILocation(line: 96, column: 12, scope: !112)
!117 = !DILocation(line: 96, column: 36, scope: !112)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !14, line: 97, type: !4)
!119 = !DILocation(line: 97, column: 12, scope: !112)
!120 = !DILocation(line: 97, column: 37, scope: !112)
!121 = !DILocation(line: 98, column: 12, scope: !112)
!122 = !DILocation(line: 98, column: 5, scope: !112)
!123 = !DILocation(line: 99, column: 5, scope: !112)
!124 = !DILocation(line: 99, column: 25, scope: !112)
!125 = !DILocation(line: 100, column: 12, scope: !112)
!126 = !DILocation(line: 100, column: 5, scope: !112)
!127 = !DILocation(line: 101, column: 5, scope: !112)
!128 = !DILocation(line: 101, column: 27, scope: !112)
!129 = !DILocation(line: 106, column: 16, scope: !112)
!130 = !DILocation(line: 106, column: 14, scope: !112)
!131 = !DILocalVariable(name: "dest", scope: !132, file: !14, line: 114, type: !37)
!132 = distinct !DILexicalBlock(scope: !112, file: !14, line: 113, column: 5)
!133 = !DILocation(line: 114, column: 14, scope: !132)
!134 = !DILocation(line: 115, column: 9, scope: !132)
!135 = !DILocation(line: 116, column: 9, scope: !132)
!136 = !DILocation(line: 116, column: 21, scope: !132)
!137 = !DILocation(line: 119, column: 9, scope: !132)
!138 = !DILocation(line: 119, column: 22, scope: !132)
!139 = !DILocation(line: 119, column: 35, scope: !132)
!140 = !DILocation(line: 119, column: 28, scope: !132)
!141 = !DILocation(line: 119, column: 40, scope: !132)
!142 = !DILocation(line: 120, column: 9, scope: !132)
!143 = !DILocation(line: 120, column: 21, scope: !132)
!144 = !DILocation(line: 121, column: 19, scope: !132)
!145 = !DILocation(line: 121, column: 9, scope: !132)
!146 = !DILocation(line: 123, column: 1, scope: !112)
