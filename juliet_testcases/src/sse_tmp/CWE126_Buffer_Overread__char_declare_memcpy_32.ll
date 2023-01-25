; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data3 = alloca i8*, align 8
  %data5 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !37
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx2, align 1, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !40, metadata !DIExpression()), !dbg !42
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !43
  %1 = load i8*, i8** %0, align 8, !dbg !44
  store i8* %1, i8** %data3, align 8, !dbg !42
  %arraydecay4 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store i8* %arraydecay4, i8** %data3, align 8, !dbg !46
  %2 = load i8*, i8** %data3, align 8, !dbg !47
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !48
  store i8* %2, i8** %3, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i8** %data5, metadata !50, metadata !DIExpression()), !dbg !52
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !53
  %5 = load i8*, i8** %4, align 8, !dbg !54
  store i8* %5, i8** %data5, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !57
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay6, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx7, align 1, !dbg !60
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %6 = load i8*, i8** %data5, align 8, !dbg !62
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !63
  %call = call i64 @strlen(i8* %arraydecay9) #7, !dbg !64
  %mul = mul i64 %call, 1, !dbg !65
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay8, i8* align 1 %6, i64 %mul, i1 false), !dbg !61
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !66
  store i8 0, i8* %arrayidx10, align 1, !dbg !67
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !68
  call void @printLine(i8* %arraydecay11), !dbg !69
  ret void, !dbg !70
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
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_32_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #8, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #8, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__char_declare_memcpy_32_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__char_declare_memcpy_32_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data3 = alloca i8*, align 8
  %data5 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !103
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !106
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx2, align 1, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !109, metadata !DIExpression()), !dbg !111
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !112
  %1 = load i8*, i8** %0, align 8, !dbg !113
  store i8* %1, i8** %data3, align 8, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i8* %arraydecay4, i8** %data3, align 8, !dbg !115
  %2 = load i8*, i8** %data3, align 8, !dbg !116
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !117
  store i8* %2, i8** %3, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i8** %data5, metadata !119, metadata !DIExpression()), !dbg !121
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !122
  %5 = load i8*, i8** %4, align 8, !dbg !123
  store i8* %5, i8** %data5, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay6, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx7, align 1, !dbg !129
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  %6 = load i8*, i8** %data5, align 8, !dbg !131
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !132
  %call = call i64 @strlen(i8* %arraydecay9) #7, !dbg !133
  %mul = mul i64 %call, 1, !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay8, i8* align 1 %6, i64 %mul, i1 false), !dbg !130
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !135
  store i8 0, i8* %arrayidx10, align 1, !dbg !136
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !137
  call void @printLine(i8* %arraydecay11), !dbg !138
  ret void, !dbg !139
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 29, column: 10, scope: !11)
!34 = !DILocation(line: 30, column: 5, scope: !11)
!35 = !DILocation(line: 31, column: 5, scope: !11)
!36 = !DILocation(line: 31, column: 25, scope: !11)
!37 = !DILocation(line: 32, column: 5, scope: !11)
!38 = !DILocation(line: 33, column: 5, scope: !11)
!39 = !DILocation(line: 33, column: 27, scope: !11)
!40 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 35, type: !16)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!42 = !DILocation(line: 35, column: 16, scope: !41)
!43 = !DILocation(line: 35, column: 24, scope: !41)
!44 = !DILocation(line: 35, column: 23, scope: !41)
!45 = !DILocation(line: 37, column: 16, scope: !41)
!46 = !DILocation(line: 37, column: 14, scope: !41)
!47 = !DILocation(line: 38, column: 21, scope: !41)
!48 = !DILocation(line: 38, column: 10, scope: !41)
!49 = !DILocation(line: 38, column: 19, scope: !41)
!50 = !DILocalVariable(name: "data", scope: !51, file: !12, line: 41, type: !16)
!51 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!52 = !DILocation(line: 41, column: 16, scope: !51)
!53 = !DILocation(line: 41, column: 24, scope: !51)
!54 = !DILocation(line: 41, column: 23, scope: !51)
!55 = !DILocalVariable(name: "dest", scope: !56, file: !12, line: 43, type: !30)
!56 = distinct !DILexicalBlock(scope: !51, file: !12, line: 42, column: 9)
!57 = !DILocation(line: 43, column: 18, scope: !56)
!58 = !DILocation(line: 44, column: 13, scope: !56)
!59 = !DILocation(line: 45, column: 13, scope: !56)
!60 = !DILocation(line: 45, column: 25, scope: !56)
!61 = !DILocation(line: 48, column: 13, scope: !56)
!62 = !DILocation(line: 48, column: 26, scope: !56)
!63 = !DILocation(line: 48, column: 39, scope: !56)
!64 = !DILocation(line: 48, column: 32, scope: !56)
!65 = !DILocation(line: 48, column: 44, scope: !56)
!66 = !DILocation(line: 49, column: 13, scope: !56)
!67 = !DILocation(line: 49, column: 25, scope: !56)
!68 = !DILocation(line: 50, column: 23, scope: !56)
!69 = !DILocation(line: 50, column: 13, scope: !56)
!70 = !DILocation(line: 53, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_32_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 94, column: 5, scope: !71)
!73 = !DILocation(line: 95, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !75, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !20}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 106, type: !77)
!79 = !DILocation(line: 106, column: 14, scope: !74)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 106, type: !20)
!81 = !DILocation(line: 106, column: 27, scope: !74)
!82 = !DILocation(line: 109, column: 22, scope: !74)
!83 = !DILocation(line: 109, column: 12, scope: !74)
!84 = !DILocation(line: 109, column: 5, scope: !74)
!85 = !DILocation(line: 111, column: 5, scope: !74)
!86 = !DILocation(line: 112, column: 5, scope: !74)
!87 = !DILocation(line: 113, column: 5, scope: !74)
!88 = !DILocation(line: 116, column: 5, scope: !74)
!89 = !DILocation(line: 117, column: 5, scope: !74)
!90 = !DILocation(line: 118, column: 5, scope: !74)
!91 = !DILocation(line: 120, column: 5, scope: !74)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 62, type: !16)
!94 = !DILocation(line: 62, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataPtr1", scope: !92, file: !12, line: 63, type: !20)
!96 = !DILocation(line: 63, column: 13, scope: !92)
!97 = !DILocalVariable(name: "dataPtr2", scope: !92, file: !12, line: 64, type: !20)
!98 = !DILocation(line: 64, column: 13, scope: !92)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !12, line: 65, type: !25)
!100 = !DILocation(line: 65, column: 10, scope: !92)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !12, line: 66, type: !30)
!102 = !DILocation(line: 66, column: 10, scope: !92)
!103 = !DILocation(line: 67, column: 5, scope: !92)
!104 = !DILocation(line: 68, column: 5, scope: !92)
!105 = !DILocation(line: 68, column: 25, scope: !92)
!106 = !DILocation(line: 69, column: 5, scope: !92)
!107 = !DILocation(line: 70, column: 5, scope: !92)
!108 = !DILocation(line: 70, column: 27, scope: !92)
!109 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 72, type: !16)
!110 = distinct !DILexicalBlock(scope: !92, file: !12, line: 71, column: 5)
!111 = !DILocation(line: 72, column: 16, scope: !110)
!112 = !DILocation(line: 72, column: 24, scope: !110)
!113 = !DILocation(line: 72, column: 23, scope: !110)
!114 = !DILocation(line: 74, column: 16, scope: !110)
!115 = !DILocation(line: 74, column: 14, scope: !110)
!116 = !DILocation(line: 75, column: 21, scope: !110)
!117 = !DILocation(line: 75, column: 10, scope: !110)
!118 = !DILocation(line: 75, column: 19, scope: !110)
!119 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 78, type: !16)
!120 = distinct !DILexicalBlock(scope: !92, file: !12, line: 77, column: 5)
!121 = !DILocation(line: 78, column: 16, scope: !120)
!122 = !DILocation(line: 78, column: 24, scope: !120)
!123 = !DILocation(line: 78, column: 23, scope: !120)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !12, line: 80, type: !30)
!125 = distinct !DILexicalBlock(scope: !120, file: !12, line: 79, column: 9)
!126 = !DILocation(line: 80, column: 18, scope: !125)
!127 = !DILocation(line: 81, column: 13, scope: !125)
!128 = !DILocation(line: 82, column: 13, scope: !125)
!129 = !DILocation(line: 82, column: 25, scope: !125)
!130 = !DILocation(line: 85, column: 13, scope: !125)
!131 = !DILocation(line: 85, column: 26, scope: !125)
!132 = !DILocation(line: 85, column: 39, scope: !125)
!133 = !DILocation(line: 85, column: 32, scope: !125)
!134 = !DILocation(line: 85, column: 44, scope: !125)
!135 = !DILocation(line: 86, column: 13, scope: !125)
!136 = !DILocation(line: 86, column: 25, scope: !125)
!137 = !DILocation(line: 87, column: 23, scope: !125)
!138 = !DILocation(line: 87, column: 13, scope: !125)
!139 = !DILocation(line: 90, column: 1, scope: !92)
