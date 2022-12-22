; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !32
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !35
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx2, align 1, !dbg !37
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !41
  %cmp = icmp slt i32 %0, 1, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store i8* %arraydecay3, i8** %data, align 8, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %1, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !54, metadata !DIExpression()), !dbg !56
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !57
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx5, align 1, !dbg !59
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  %2 = load i8*, i8** %data, align 8, !dbg !61
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !63
  %mul = mul i64 %call, 1, !dbg !64
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %2, i64 %mul, i1 false), !dbg !60
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx8, align 1, !dbg !66
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  call void @printLine(i8* %arraydecay9), !dbg !68
  ret void, !dbg !69
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
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_17_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #8, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #8, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__char_declare_memmove_17_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__char_declare_memmove_17_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !100
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !103
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx2, align 1, !dbg !105
  store i32 0, i32* %h, align 4, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !109
  %cmp = icmp slt i32 %0, 1, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i8* %arraydecay3, i8** %data, align 8, !dbg !115
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !117
  %inc = add nsw i32 %1, 1, !dbg !117
  store i32 %inc, i32* %h, align 4, !dbg !117
  br label %for.cond, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx5, align 1, !dbg !126
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  %2 = load i8*, i8** %data, align 8, !dbg !128
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !130
  %mul = mul i64 %call, 1, !dbg !131
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %2, i64 %mul, i1 false), !dbg !127
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx8, align 1, !dbg !133
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !134
  call void @printLine(i8* %arraydecay9), !dbg !135
  ret void, !dbg !136
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 26, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 27, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 28, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 28, column: 10, scope: !11)
!32 = !DILocation(line: 29, column: 5, scope: !11)
!33 = !DILocation(line: 30, column: 5, scope: !11)
!34 = !DILocation(line: 30, column: 25, scope: !11)
!35 = !DILocation(line: 31, column: 5, scope: !11)
!36 = !DILocation(line: 32, column: 5, scope: !11)
!37 = !DILocation(line: 32, column: 27, scope: !11)
!38 = !DILocation(line: 33, column: 11, scope: !39)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!40 = !DILocation(line: 33, column: 9, scope: !39)
!41 = !DILocation(line: 33, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 33, column: 5)
!43 = !DILocation(line: 33, column: 18, scope: !42)
!44 = !DILocation(line: 33, column: 5, scope: !39)
!45 = !DILocation(line: 36, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 34, column: 5)
!47 = !DILocation(line: 36, column: 14, scope: !46)
!48 = !DILocation(line: 37, column: 5, scope: !46)
!49 = !DILocation(line: 33, column: 24, scope: !42)
!50 = !DILocation(line: 33, column: 5, scope: !42)
!51 = distinct !{!51, !44, !52, !53}
!52 = !DILocation(line: 37, column: 5, scope: !39)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocalVariable(name: "dest", scope: !55, file: !12, line: 39, type: !28)
!55 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!56 = !DILocation(line: 39, column: 14, scope: !55)
!57 = !DILocation(line: 40, column: 9, scope: !55)
!58 = !DILocation(line: 41, column: 9, scope: !55)
!59 = !DILocation(line: 41, column: 21, scope: !55)
!60 = !DILocation(line: 44, column: 9, scope: !55)
!61 = !DILocation(line: 44, column: 23, scope: !55)
!62 = !DILocation(line: 44, column: 36, scope: !55)
!63 = !DILocation(line: 44, column: 29, scope: !55)
!64 = !DILocation(line: 44, column: 41, scope: !55)
!65 = !DILocation(line: 45, column: 9, scope: !55)
!66 = !DILocation(line: 45, column: 21, scope: !55)
!67 = !DILocation(line: 46, column: 19, scope: !55)
!68 = !DILocation(line: 46, column: 9, scope: !55)
!69 = !DILocation(line: 48, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_17_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 84, column: 5, scope: !70)
!72 = !DILocation(line: 85, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !74, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!16, !16, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 97, type: !16)
!78 = !DILocation(line: 97, column: 14, scope: !73)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 97, type: !76)
!80 = !DILocation(line: 97, column: 27, scope: !73)
!81 = !DILocation(line: 100, column: 22, scope: !73)
!82 = !DILocation(line: 100, column: 12, scope: !73)
!83 = !DILocation(line: 100, column: 5, scope: !73)
!84 = !DILocation(line: 102, column: 5, scope: !73)
!85 = !DILocation(line: 103, column: 5, scope: !73)
!86 = !DILocation(line: 104, column: 5, scope: !73)
!87 = !DILocation(line: 107, column: 5, scope: !73)
!88 = !DILocation(line: 108, column: 5, scope: !73)
!89 = !DILocation(line: 109, column: 5, scope: !73)
!90 = !DILocation(line: 111, column: 5, scope: !73)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "h", scope: !91, file: !12, line: 57, type: !16)
!93 = !DILocation(line: 57, column: 9, scope: !91)
!94 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 58, type: !19)
!95 = !DILocation(line: 58, column: 12, scope: !91)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 59, type: !23)
!97 = !DILocation(line: 59, column: 10, scope: !91)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 60, type: !28)
!99 = !DILocation(line: 60, column: 10, scope: !91)
!100 = !DILocation(line: 61, column: 5, scope: !91)
!101 = !DILocation(line: 62, column: 5, scope: !91)
!102 = !DILocation(line: 62, column: 25, scope: !91)
!103 = !DILocation(line: 63, column: 5, scope: !91)
!104 = !DILocation(line: 64, column: 5, scope: !91)
!105 = !DILocation(line: 64, column: 27, scope: !91)
!106 = !DILocation(line: 65, column: 11, scope: !107)
!107 = distinct !DILexicalBlock(scope: !91, file: !12, line: 65, column: 5)
!108 = !DILocation(line: 65, column: 9, scope: !107)
!109 = !DILocation(line: 65, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 65, column: 5)
!111 = !DILocation(line: 65, column: 18, scope: !110)
!112 = !DILocation(line: 65, column: 5, scope: !107)
!113 = !DILocation(line: 68, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 66, column: 5)
!115 = !DILocation(line: 68, column: 14, scope: !114)
!116 = !DILocation(line: 69, column: 5, scope: !114)
!117 = !DILocation(line: 65, column: 24, scope: !110)
!118 = !DILocation(line: 65, column: 5, scope: !110)
!119 = distinct !{!119, !112, !120, !53}
!120 = !DILocation(line: 69, column: 5, scope: !107)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !12, line: 71, type: !28)
!122 = distinct !DILexicalBlock(scope: !91, file: !12, line: 70, column: 5)
!123 = !DILocation(line: 71, column: 14, scope: !122)
!124 = !DILocation(line: 72, column: 9, scope: !122)
!125 = !DILocation(line: 73, column: 9, scope: !122)
!126 = !DILocation(line: 73, column: 21, scope: !122)
!127 = !DILocation(line: 76, column: 9, scope: !122)
!128 = !DILocation(line: 76, column: 23, scope: !122)
!129 = !DILocation(line: 76, column: 36, scope: !122)
!130 = !DILocation(line: 76, column: 29, scope: !122)
!131 = !DILocation(line: 76, column: 41, scope: !122)
!132 = !DILocation(line: 77, column: 9, scope: !122)
!133 = !DILocation(line: 77, column: 21, scope: !122)
!134 = !DILocation(line: 78, column: 19, scope: !122)
!135 = !DILocation(line: 78, column: 9, scope: !122)
!136 = !DILocation(line: 80, column: 1, scope: !91)
