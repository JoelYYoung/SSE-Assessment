; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 50, align 16, !dbg !25
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 100, align 16, !dbg !28
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !27
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !30
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !34
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !35
  store i8 0, i8* %arrayidx1, align 1, !dbg !36
  %6 = load i32, i32* @staticFive, align 4, !dbg !37
  %cmp = icmp eq i32 %6, 5, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataBadBuffer, align 8, !dbg !41
  store i8* %7, i8** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx2, align 1, !dbg !53
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %8 = load i8*, i8** %data, align 8, !dbg !55
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !57
  %mul = mul i64 %call, 1, !dbg !58
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !54
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx5, align 1, !dbg !60
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  call void @printLine(i8* %arraydecay6), !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_07_good() #0 !dbg !64 {
entry:
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #8, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #8, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__char_alloca_memmove_07_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__char_alloca_memmove_07_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 50, align 16, !dbg !91
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %1 = alloca i8, i64 100, align 16, !dbg !94
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !93
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !96
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !100
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !101
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !101
  store i8 0, i8* %arrayidx1, align 1, !dbg !102
  %6 = load i32, i32* @staticFive, align 4, !dbg !103
  %cmp = icmp ne i32 %6, 5, !dbg !105
  br i1 %cmp, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !107
  br label %if.end, !dbg !109

if.else:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !110
  store i8* %7, i8** %data, align 8, !dbg !112
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !116
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx2, align 1, !dbg !118
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  %8 = load i8*, i8** %data, align 8, !dbg !120
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !121
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !122
  %mul = mul i64 %call, 1, !dbg !123
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !119
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx5, align 1, !dbg !125
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @printLine(i8* %arraydecay6), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !129 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %0 = alloca i8, i64 50, align 16, !dbg !134
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %1 = alloca i8, i64 100, align 16, !dbg !137
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !136
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !139
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !140
  store i8 0, i8* %arrayidx, align 1, !dbg !141
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !143
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !144
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !144
  store i8 0, i8* %arrayidx1, align 1, !dbg !145
  %6 = load i32, i32* @staticFive, align 4, !dbg !146
  %cmp = icmp eq i32 %6, 5, !dbg !148
  br i1 %cmp, label %if.then, label %if.end, !dbg !149

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !150
  store i8* %7, i8** %data, align 8, !dbg !152
  br label %if.end, !dbg !153

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !154, metadata !DIExpression()), !dbg !156
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !157
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !158
  store i8 0, i8* %arrayidx2, align 1, !dbg !159
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !160
  %8 = load i8*, i8** %data, align 8, !dbg !161
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !162
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !163
  %mul = mul i64 %call, 1, !dbg !164
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !160
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx5, align 1, !dbg !166
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @printLine(i8* %arraydecay6), !dbg !168
  ret void, !dbg !169
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_07_bad", scope: !10, file: !10, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 31, type: !6)
!22 = !DILocation(line: 31, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocation(line: 32, column: 36, scope: !18)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 12, scope: !18)
!28 = !DILocation(line: 33, column: 37, scope: !18)
!29 = !DILocation(line: 34, column: 12, scope: !18)
!30 = !DILocation(line: 34, column: 5, scope: !18)
!31 = !DILocation(line: 35, column: 5, scope: !18)
!32 = !DILocation(line: 35, column: 25, scope: !18)
!33 = !DILocation(line: 36, column: 12, scope: !18)
!34 = !DILocation(line: 36, column: 5, scope: !18)
!35 = !DILocation(line: 37, column: 5, scope: !18)
!36 = !DILocation(line: 37, column: 27, scope: !18)
!37 = !DILocation(line: 38, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !18, file: !10, line: 38, column: 8)
!39 = !DILocation(line: 38, column: 18, scope: !38)
!40 = !DILocation(line: 38, column: 8, scope: !18)
!41 = !DILocation(line: 41, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !10, line: 39, column: 5)
!43 = !DILocation(line: 41, column: 14, scope: !42)
!44 = !DILocation(line: 42, column: 5, scope: !42)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !10, line: 44, type: !47)
!46 = distinct !DILexicalBlock(scope: !18, file: !10, line: 43, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 44, column: 14, scope: !46)
!51 = !DILocation(line: 45, column: 9, scope: !46)
!52 = !DILocation(line: 46, column: 9, scope: !46)
!53 = !DILocation(line: 46, column: 21, scope: !46)
!54 = !DILocation(line: 49, column: 9, scope: !46)
!55 = !DILocation(line: 49, column: 23, scope: !46)
!56 = !DILocation(line: 49, column: 36, scope: !46)
!57 = !DILocation(line: 49, column: 29, scope: !46)
!58 = !DILocation(line: 49, column: 41, scope: !46)
!59 = !DILocation(line: 50, column: 9, scope: !46)
!60 = !DILocation(line: 50, column: 21, scope: !46)
!61 = !DILocation(line: 51, column: 19, scope: !46)
!62 = !DILocation(line: 51, column: 9, scope: !46)
!63 = !DILocation(line: 53, column: 1, scope: !18)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_07_good", scope: !10, file: !10, line: 118, type: !19, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocation(line: 120, column: 5, scope: !64)
!66 = !DILocation(line: 121, column: 5, scope: !64)
!67 = !DILocation(line: 122, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 134, type: !69, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!11, !11, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !10, line: 134, type: !11)
!73 = !DILocation(line: 134, column: 14, scope: !68)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !10, line: 134, type: !71)
!75 = !DILocation(line: 134, column: 27, scope: !68)
!76 = !DILocation(line: 137, column: 22, scope: !68)
!77 = !DILocation(line: 137, column: 12, scope: !68)
!78 = !DILocation(line: 137, column: 5, scope: !68)
!79 = !DILocation(line: 139, column: 5, scope: !68)
!80 = !DILocation(line: 140, column: 5, scope: !68)
!81 = !DILocation(line: 141, column: 5, scope: !68)
!82 = !DILocation(line: 144, column: 5, scope: !68)
!83 = !DILocation(line: 145, column: 5, scope: !68)
!84 = !DILocation(line: 146, column: 5, scope: !68)
!85 = !DILocation(line: 148, column: 5, scope: !68)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !10, line: 62, type: !6)
!88 = !DILocation(line: 62, column: 12, scope: !86)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !10, line: 63, type: !6)
!90 = !DILocation(line: 63, column: 12, scope: !86)
!91 = !DILocation(line: 63, column: 36, scope: !86)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !10, line: 64, type: !6)
!93 = !DILocation(line: 64, column: 12, scope: !86)
!94 = !DILocation(line: 64, column: 37, scope: !86)
!95 = !DILocation(line: 65, column: 12, scope: !86)
!96 = !DILocation(line: 65, column: 5, scope: !86)
!97 = !DILocation(line: 66, column: 5, scope: !86)
!98 = !DILocation(line: 66, column: 25, scope: !86)
!99 = !DILocation(line: 67, column: 12, scope: !86)
!100 = !DILocation(line: 67, column: 5, scope: !86)
!101 = !DILocation(line: 68, column: 5, scope: !86)
!102 = !DILocation(line: 68, column: 27, scope: !86)
!103 = !DILocation(line: 69, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !86, file: !10, line: 69, column: 8)
!105 = !DILocation(line: 69, column: 18, scope: !104)
!106 = !DILocation(line: 69, column: 8, scope: !86)
!107 = !DILocation(line: 72, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !10, line: 70, column: 5)
!109 = !DILocation(line: 73, column: 5, scope: !108)
!110 = !DILocation(line: 77, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !10, line: 75, column: 5)
!112 = !DILocation(line: 77, column: 14, scope: !111)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !10, line: 80, type: !47)
!114 = distinct !DILexicalBlock(scope: !86, file: !10, line: 79, column: 5)
!115 = !DILocation(line: 80, column: 14, scope: !114)
!116 = !DILocation(line: 81, column: 9, scope: !114)
!117 = !DILocation(line: 82, column: 9, scope: !114)
!118 = !DILocation(line: 82, column: 21, scope: !114)
!119 = !DILocation(line: 85, column: 9, scope: !114)
!120 = !DILocation(line: 85, column: 23, scope: !114)
!121 = !DILocation(line: 85, column: 36, scope: !114)
!122 = !DILocation(line: 85, column: 29, scope: !114)
!123 = !DILocation(line: 85, column: 41, scope: !114)
!124 = !DILocation(line: 86, column: 9, scope: !114)
!125 = !DILocation(line: 86, column: 21, scope: !114)
!126 = !DILocation(line: 87, column: 19, scope: !114)
!127 = !DILocation(line: 87, column: 9, scope: !114)
!128 = !DILocation(line: 89, column: 1, scope: !86)
!129 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 92, type: !19, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", scope: !129, file: !10, line: 94, type: !6)
!131 = !DILocation(line: 94, column: 12, scope: !129)
!132 = !DILocalVariable(name: "dataBadBuffer", scope: !129, file: !10, line: 95, type: !6)
!133 = !DILocation(line: 95, column: 12, scope: !129)
!134 = !DILocation(line: 95, column: 36, scope: !129)
!135 = !DILocalVariable(name: "dataGoodBuffer", scope: !129, file: !10, line: 96, type: !6)
!136 = !DILocation(line: 96, column: 12, scope: !129)
!137 = !DILocation(line: 96, column: 37, scope: !129)
!138 = !DILocation(line: 97, column: 12, scope: !129)
!139 = !DILocation(line: 97, column: 5, scope: !129)
!140 = !DILocation(line: 98, column: 5, scope: !129)
!141 = !DILocation(line: 98, column: 25, scope: !129)
!142 = !DILocation(line: 99, column: 12, scope: !129)
!143 = !DILocation(line: 99, column: 5, scope: !129)
!144 = !DILocation(line: 100, column: 5, scope: !129)
!145 = !DILocation(line: 100, column: 27, scope: !129)
!146 = !DILocation(line: 101, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !129, file: !10, line: 101, column: 8)
!148 = !DILocation(line: 101, column: 18, scope: !147)
!149 = !DILocation(line: 101, column: 8, scope: !129)
!150 = !DILocation(line: 104, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !10, line: 102, column: 5)
!152 = !DILocation(line: 104, column: 14, scope: !151)
!153 = !DILocation(line: 105, column: 5, scope: !151)
!154 = !DILocalVariable(name: "dest", scope: !155, file: !10, line: 107, type: !47)
!155 = distinct !DILexicalBlock(scope: !129, file: !10, line: 106, column: 5)
!156 = !DILocation(line: 107, column: 14, scope: !155)
!157 = !DILocation(line: 108, column: 9, scope: !155)
!158 = !DILocation(line: 109, column: 9, scope: !155)
!159 = !DILocation(line: 109, column: 21, scope: !155)
!160 = !DILocation(line: 112, column: 9, scope: !155)
!161 = !DILocation(line: 112, column: 23, scope: !155)
!162 = !DILocation(line: 112, column: 36, scope: !155)
!163 = !DILocation(line: 112, column: 29, scope: !155)
!164 = !DILocation(line: 112, column: 41, scope: !155)
!165 = !DILocation(line: 113, column: 9, scope: !155)
!166 = !DILocation(line: 113, column: 21, scope: !155)
!167 = !DILocation(line: 114, column: 19, scope: !155)
!168 = !DILocation(line: 114, column: 9, scope: !155)
!169 = !DILocation(line: 116, column: 1, scope: !129)
