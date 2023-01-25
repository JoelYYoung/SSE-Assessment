; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !33
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !36
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i8 0, i8* %arrayidx2, align 1, !dbg !38
  %0 = load i32, i32* @staticFive, align 4, !dbg !39
  %cmp = icmp eq i32 %0, 5, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store i8* %arraydecay3, i8** %data, align 8, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !49
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx5, align 1, !dbg !52
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  %1 = load i8*, i8** %data, align 8, !dbg !54
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !56
  %mul = mul i64 %call, 1, !dbg !57
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !53
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx8, align 1, !dbg !59
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @printLine(i8* %arraydecay9), !dbg !61
  ret void, !dbg !62
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
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_07_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #8, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #8, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__char_declare_memmove_07_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__char_declare_memmove_07_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !92
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !95
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx2, align 1, !dbg !97
  %0 = load i32, i32* @staticFive, align 4, !dbg !98
  %cmp = icmp ne i32 %0, 5, !dbg !100
  br i1 %cmp, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  br label %if.end, !dbg !104

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !105
  store i8* %arraydecay3, i8** %data, align 8, !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !111
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx5, align 1, !dbg !113
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  %1 = load i8*, i8** %data, align 8, !dbg !115
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !116
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !117
  %mul = mul i64 %call, 1, !dbg !118
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !114
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx8, align 1, !dbg !120
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !121
  call void @printLine(i8* %arraydecay9), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !124 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !131
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !132
  store i8 0, i8* %arrayidx, align 1, !dbg !133
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !134
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !135
  store i8 0, i8* %arrayidx2, align 1, !dbg !136
  %0 = load i32, i32* @staticFive, align 4, !dbg !137
  %cmp = icmp eq i32 %0, 5, !dbg !139
  br i1 %cmp, label %if.then, label %if.end, !dbg !140

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !141
  store i8* %arraydecay3, i8** %data, align 8, !dbg !143
  br label %if.end, !dbg !144

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !145, metadata !DIExpression()), !dbg !147
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !148
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !149
  store i8 0, i8* %arrayidx5, align 1, !dbg !150
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !151
  %1 = load i8*, i8** %data, align 8, !dbg !152
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !153
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !154
  %mul = mul i64 %call, 1, !dbg !155
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !151
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !156
  store i8 0, i8* %arrayidx8, align 1, !dbg !157
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !158
  call void @printLine(i8* %arraydecay9), !dbg !159
  ret void, !dbg !160
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 32, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 33, column: 10, scope: !16)
!33 = !DILocation(line: 34, column: 5, scope: !16)
!34 = !DILocation(line: 35, column: 5, scope: !16)
!35 = !DILocation(line: 35, column: 25, scope: !16)
!36 = !DILocation(line: 36, column: 5, scope: !16)
!37 = !DILocation(line: 37, column: 5, scope: !16)
!38 = !DILocation(line: 37, column: 27, scope: !16)
!39 = !DILocation(line: 38, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !16, file: !8, line: 38, column: 8)
!41 = !DILocation(line: 38, column: 18, scope: !40)
!42 = !DILocation(line: 38, column: 8, scope: !16)
!43 = !DILocation(line: 41, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !8, line: 39, column: 5)
!45 = !DILocation(line: 41, column: 14, scope: !44)
!46 = !DILocation(line: 42, column: 5, scope: !44)
!47 = !DILocalVariable(name: "dest", scope: !48, file: !8, line: 44, type: !29)
!48 = distinct !DILexicalBlock(scope: !16, file: !8, line: 43, column: 5)
!49 = !DILocation(line: 44, column: 14, scope: !48)
!50 = !DILocation(line: 45, column: 9, scope: !48)
!51 = !DILocation(line: 46, column: 9, scope: !48)
!52 = !DILocation(line: 46, column: 21, scope: !48)
!53 = !DILocation(line: 49, column: 9, scope: !48)
!54 = !DILocation(line: 49, column: 23, scope: !48)
!55 = !DILocation(line: 49, column: 36, scope: !48)
!56 = !DILocation(line: 49, column: 29, scope: !48)
!57 = !DILocation(line: 49, column: 41, scope: !48)
!58 = !DILocation(line: 50, column: 9, scope: !48)
!59 = !DILocation(line: 50, column: 21, scope: !48)
!60 = !DILocation(line: 51, column: 19, scope: !48)
!61 = !DILocation(line: 51, column: 9, scope: !48)
!62 = !DILocation(line: 53, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_07_good", scope: !8, file: !8, line: 118, type: !17, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocation(line: 120, column: 5, scope: !63)
!65 = !DILocation(line: 121, column: 5, scope: !63)
!66 = !DILocation(line: 122, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 134, type: !68, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DISubroutineType(types: !69)
!69 = !{!9, !9, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !8, line: 134, type: !9)
!72 = !DILocation(line: 134, column: 14, scope: !67)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !8, line: 134, type: !70)
!74 = !DILocation(line: 134, column: 27, scope: !67)
!75 = !DILocation(line: 137, column: 22, scope: !67)
!76 = !DILocation(line: 137, column: 12, scope: !67)
!77 = !DILocation(line: 137, column: 5, scope: !67)
!78 = !DILocation(line: 139, column: 5, scope: !67)
!79 = !DILocation(line: 140, column: 5, scope: !67)
!80 = !DILocation(line: 141, column: 5, scope: !67)
!81 = !DILocation(line: 144, column: 5, scope: !67)
!82 = !DILocation(line: 145, column: 5, scope: !67)
!83 = !DILocation(line: 146, column: 5, scope: !67)
!84 = !DILocation(line: 148, column: 5, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocalVariable(name: "data", scope: !85, file: !8, line: 62, type: !20)
!87 = !DILocation(line: 62, column: 12, scope: !85)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !8, line: 63, type: !24)
!89 = !DILocation(line: 63, column: 10, scope: !85)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !8, line: 64, type: !29)
!91 = !DILocation(line: 64, column: 10, scope: !85)
!92 = !DILocation(line: 65, column: 5, scope: !85)
!93 = !DILocation(line: 66, column: 5, scope: !85)
!94 = !DILocation(line: 66, column: 25, scope: !85)
!95 = !DILocation(line: 67, column: 5, scope: !85)
!96 = !DILocation(line: 68, column: 5, scope: !85)
!97 = !DILocation(line: 68, column: 27, scope: !85)
!98 = !DILocation(line: 69, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !85, file: !8, line: 69, column: 8)
!100 = !DILocation(line: 69, column: 18, scope: !99)
!101 = !DILocation(line: 69, column: 8, scope: !85)
!102 = !DILocation(line: 72, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !8, line: 70, column: 5)
!104 = !DILocation(line: 73, column: 5, scope: !103)
!105 = !DILocation(line: 77, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !99, file: !8, line: 75, column: 5)
!107 = !DILocation(line: 77, column: 14, scope: !106)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !8, line: 80, type: !29)
!109 = distinct !DILexicalBlock(scope: !85, file: !8, line: 79, column: 5)
!110 = !DILocation(line: 80, column: 14, scope: !109)
!111 = !DILocation(line: 81, column: 9, scope: !109)
!112 = !DILocation(line: 82, column: 9, scope: !109)
!113 = !DILocation(line: 82, column: 21, scope: !109)
!114 = !DILocation(line: 85, column: 9, scope: !109)
!115 = !DILocation(line: 85, column: 23, scope: !109)
!116 = !DILocation(line: 85, column: 36, scope: !109)
!117 = !DILocation(line: 85, column: 29, scope: !109)
!118 = !DILocation(line: 85, column: 41, scope: !109)
!119 = !DILocation(line: 86, column: 9, scope: !109)
!120 = !DILocation(line: 86, column: 21, scope: !109)
!121 = !DILocation(line: 87, column: 19, scope: !109)
!122 = !DILocation(line: 87, column: 9, scope: !109)
!123 = !DILocation(line: 89, column: 1, scope: !85)
!124 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 92, type: !17, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !8, line: 94, type: !20)
!126 = !DILocation(line: 94, column: 12, scope: !124)
!127 = !DILocalVariable(name: "dataBadBuffer", scope: !124, file: !8, line: 95, type: !24)
!128 = !DILocation(line: 95, column: 10, scope: !124)
!129 = !DILocalVariable(name: "dataGoodBuffer", scope: !124, file: !8, line: 96, type: !29)
!130 = !DILocation(line: 96, column: 10, scope: !124)
!131 = !DILocation(line: 97, column: 5, scope: !124)
!132 = !DILocation(line: 98, column: 5, scope: !124)
!133 = !DILocation(line: 98, column: 25, scope: !124)
!134 = !DILocation(line: 99, column: 5, scope: !124)
!135 = !DILocation(line: 100, column: 5, scope: !124)
!136 = !DILocation(line: 100, column: 27, scope: !124)
!137 = !DILocation(line: 101, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !124, file: !8, line: 101, column: 8)
!139 = !DILocation(line: 101, column: 18, scope: !138)
!140 = !DILocation(line: 101, column: 8, scope: !124)
!141 = !DILocation(line: 104, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !8, line: 102, column: 5)
!143 = !DILocation(line: 104, column: 14, scope: !142)
!144 = !DILocation(line: 105, column: 5, scope: !142)
!145 = !DILocalVariable(name: "dest", scope: !146, file: !8, line: 107, type: !29)
!146 = distinct !DILexicalBlock(scope: !124, file: !8, line: 106, column: 5)
!147 = !DILocation(line: 107, column: 14, scope: !146)
!148 = !DILocation(line: 108, column: 9, scope: !146)
!149 = !DILocation(line: 109, column: 9, scope: !146)
!150 = !DILocation(line: 109, column: 21, scope: !146)
!151 = !DILocation(line: 112, column: 9, scope: !146)
!152 = !DILocation(line: 112, column: 23, scope: !146)
!153 = !DILocation(line: 112, column: 36, scope: !146)
!154 = !DILocation(line: 112, column: 29, scope: !146)
!155 = !DILocation(line: 112, column: 41, scope: !146)
!156 = !DILocation(line: 113, column: 9, scope: !146)
!157 = !DILocation(line: 113, column: 21, scope: !146)
!158 = !DILocation(line: 114, column: 19, scope: !146)
!159 = !DILocation(line: 114, column: 9, scope: !146)
!160 = !DILocation(line: 116, column: 1, scope: !124)
