; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay3, i8** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !39
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx5, align 1, !dbg !42
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %0 = load i8*, i8** %data, align 8, !dbg !44
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !46
  %mul = mul i64 %call, 1, !dbg !47
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !43
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx8, align 1, !dbg !49
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @printLine(i8* %arraydecay9), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_15_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #8, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #8, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__char_declare_memmove_15_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__char_declare_memmove_15_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !83
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !86
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !87
  store i8 0, i8* %arrayidx2, align 1, !dbg !88
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !89
  store i8* %arraydecay3, i8** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !94
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !95
  store i8 0, i8* %arrayidx5, align 1, !dbg !96
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !97
  %0 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !100
  %mul = mul i64 %call, 1, !dbg !101
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !97
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx8, align 1, !dbg !103
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  call void @printLine(i8* %arraydecay9), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !114
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !117
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx2, align 1, !dbg !119
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  store i8* %arraydecay3, i8** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx5, align 1, !dbg !127
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !128
  %0 = load i8*, i8** %data, align 8, !dbg !129
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !131
  %mul = mul i64 %call, 1, !dbg !132
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !128
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !133
  store i8 0, i8* %arrayidx8, align 1, !dbg !134
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !135
  call void @printLine(i8* %arraydecay9), !dbg !136
  ret void, !dbg !137
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 25, scope: !11)
!32 = !DILocation(line: 30, column: 5, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 27, scope: !11)
!35 = !DILocation(line: 36, column: 16, scope: !11)
!36 = !DILocation(line: 36, column: 14, scope: !11)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 44, type: !25)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!39 = !DILocation(line: 44, column: 14, scope: !38)
!40 = !DILocation(line: 45, column: 9, scope: !38)
!41 = !DILocation(line: 46, column: 9, scope: !38)
!42 = !DILocation(line: 46, column: 21, scope: !38)
!43 = !DILocation(line: 49, column: 9, scope: !38)
!44 = !DILocation(line: 49, column: 23, scope: !38)
!45 = !DILocation(line: 49, column: 36, scope: !38)
!46 = !DILocation(line: 49, column: 29, scope: !38)
!47 = !DILocation(line: 49, column: 41, scope: !38)
!48 = !DILocation(line: 50, column: 9, scope: !38)
!49 = !DILocation(line: 50, column: 21, scope: !38)
!50 = !DILocation(line: 51, column: 19, scope: !38)
!51 = !DILocation(line: 51, column: 9, scope: !38)
!52 = !DILocation(line: 53, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_15_good", scope: !12, file: !12, line: 125, type: !13, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 127, column: 5, scope: !53)
!55 = !DILocation(line: 128, column: 5, scope: !53)
!56 = !DILocation(line: 129, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 141, type: !58, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 141, type: !60)
!63 = !DILocation(line: 141, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 141, type: !61)
!65 = !DILocation(line: 141, column: 27, scope: !57)
!66 = !DILocation(line: 144, column: 22, scope: !57)
!67 = !DILocation(line: 144, column: 12, scope: !57)
!68 = !DILocation(line: 144, column: 5, scope: !57)
!69 = !DILocation(line: 146, column: 5, scope: !57)
!70 = !DILocation(line: 147, column: 5, scope: !57)
!71 = !DILocation(line: 148, column: 5, scope: !57)
!72 = !DILocation(line: 151, column: 5, scope: !57)
!73 = !DILocation(line: 152, column: 5, scope: !57)
!74 = !DILocation(line: 153, column: 5, scope: !57)
!75 = !DILocation(line: 155, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 62, type: !16)
!78 = !DILocation(line: 62, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !12, line: 63, type: !20)
!80 = !DILocation(line: 63, column: 10, scope: !76)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !12, line: 64, type: !25)
!82 = !DILocation(line: 64, column: 10, scope: !76)
!83 = !DILocation(line: 65, column: 5, scope: !76)
!84 = !DILocation(line: 66, column: 5, scope: !76)
!85 = !DILocation(line: 66, column: 25, scope: !76)
!86 = !DILocation(line: 67, column: 5, scope: !76)
!87 = !DILocation(line: 68, column: 5, scope: !76)
!88 = !DILocation(line: 68, column: 27, scope: !76)
!89 = !DILocation(line: 77, column: 16, scope: !76)
!90 = !DILocation(line: 77, column: 14, scope: !76)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !12, line: 81, type: !25)
!92 = distinct !DILexicalBlock(scope: !76, file: !12, line: 80, column: 5)
!93 = !DILocation(line: 81, column: 14, scope: !92)
!94 = !DILocation(line: 82, column: 9, scope: !92)
!95 = !DILocation(line: 83, column: 9, scope: !92)
!96 = !DILocation(line: 83, column: 21, scope: !92)
!97 = !DILocation(line: 86, column: 9, scope: !92)
!98 = !DILocation(line: 86, column: 23, scope: !92)
!99 = !DILocation(line: 86, column: 36, scope: !92)
!100 = !DILocation(line: 86, column: 29, scope: !92)
!101 = !DILocation(line: 86, column: 41, scope: !92)
!102 = !DILocation(line: 87, column: 9, scope: !92)
!103 = !DILocation(line: 87, column: 21, scope: !92)
!104 = !DILocation(line: 88, column: 19, scope: !92)
!105 = !DILocation(line: 88, column: 9, scope: !92)
!106 = !DILocation(line: 90, column: 1, scope: !76)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 95, type: !16)
!109 = !DILocation(line: 95, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !12, line: 96, type: !20)
!111 = !DILocation(line: 96, column: 10, scope: !107)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !12, line: 97, type: !25)
!113 = !DILocation(line: 97, column: 10, scope: !107)
!114 = !DILocation(line: 98, column: 5, scope: !107)
!115 = !DILocation(line: 99, column: 5, scope: !107)
!116 = !DILocation(line: 99, column: 25, scope: !107)
!117 = !DILocation(line: 100, column: 5, scope: !107)
!118 = !DILocation(line: 101, column: 5, scope: !107)
!119 = !DILocation(line: 101, column: 27, scope: !107)
!120 = !DILocation(line: 106, column: 16, scope: !107)
!121 = !DILocation(line: 106, column: 14, scope: !107)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !12, line: 114, type: !25)
!123 = distinct !DILexicalBlock(scope: !107, file: !12, line: 113, column: 5)
!124 = !DILocation(line: 114, column: 14, scope: !123)
!125 = !DILocation(line: 115, column: 9, scope: !123)
!126 = !DILocation(line: 116, column: 9, scope: !123)
!127 = !DILocation(line: 116, column: 21, scope: !123)
!128 = !DILocation(line: 119, column: 9, scope: !123)
!129 = !DILocation(line: 119, column: 23, scope: !123)
!130 = !DILocation(line: 119, column: 36, scope: !123)
!131 = !DILocation(line: 119, column: 29, scope: !123)
!132 = !DILocation(line: 119, column: 41, scope: !123)
!133 = !DILocation(line: 120, column: 9, scope: !123)
!134 = !DILocation(line: 120, column: 21, scope: !123)
!135 = !DILocation(line: 121, column: 19, scope: !123)
!136 = !DILocation(line: 121, column: 9, scope: !123)
!137 = !DILocation(line: 123, column: 1, scope: !107)
