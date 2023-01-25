; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !32
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !36
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !37
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !37
  store i8 0, i8* %arrayidx1, align 1, !dbg !38
  %6 = load i32, i32* @staticTrue, align 4, !dbg !39
  %tobool = icmp ne i32 %6, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataBadBuffer, align 8, !dbg !42
  store i8* %7, i8** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx2, align 1, !dbg !54
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %8 = load i8*, i8** %data, align 8, !dbg !56
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !58
  %mul = mul i64 %call, 1, !dbg !59
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !55
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx5, align 1, !dbg !61
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  call void @printLine(i8* %arraydecay6), !dbg !63
  ret void, !dbg !64
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
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_05_good() #0 !dbg !65 {
entry:
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
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
  call void @CWE126_Buffer_Overread__char_alloca_memmove_05_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__char_alloca_memmove_05_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 50, align 16, !dbg !92
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %1 = alloca i8, i64 100, align 16, !dbg !95
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !94
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !97
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !101
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !102
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !102
  store i8 0, i8* %arrayidx1, align 1, !dbg !103
  %6 = load i32, i32* @staticFalse, align 4, !dbg !104
  %tobool = icmp ne i32 %6, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.else, !dbg !106

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
  %6 = load i32, i32* @staticTrue, align 4, !dbg !146
  %tobool = icmp ne i32 %6, 0, !dbg !146
  br i1 %tobool, label %if.then, label %if.end, !dbg !148

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !149
  store i8* %7, i8** %data, align 8, !dbg !151
  br label %if.end, !dbg !152

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !153, metadata !DIExpression()), !dbg !155
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !156
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !157
  store i8 0, i8* %arrayidx2, align 1, !dbg !158
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !159
  %8 = load i8*, i8** %data, align 8, !dbg !160
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !161
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !162
  %mul = mul i64 %call, 1, !dbg !163
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !159
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !164
  store i8 0, i8* %arrayidx5, align 1, !dbg !165
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !166
  call void @printLine(i8* %arraydecay6), !dbg !167
  ret void, !dbg !168
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
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 36, scope: !20)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !12, line: 34, type: !6)
!29 = !DILocation(line: 34, column: 12, scope: !20)
!30 = !DILocation(line: 34, column: 37, scope: !20)
!31 = !DILocation(line: 35, column: 12, scope: !20)
!32 = !DILocation(line: 35, column: 5, scope: !20)
!33 = !DILocation(line: 36, column: 5, scope: !20)
!34 = !DILocation(line: 36, column: 25, scope: !20)
!35 = !DILocation(line: 37, column: 12, scope: !20)
!36 = !DILocation(line: 37, column: 5, scope: !20)
!37 = !DILocation(line: 38, column: 5, scope: !20)
!38 = !DILocation(line: 38, column: 27, scope: !20)
!39 = !DILocation(line: 39, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !20, file: !12, line: 39, column: 8)
!41 = !DILocation(line: 39, column: 8, scope: !20)
!42 = !DILocation(line: 42, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 40, column: 5)
!44 = !DILocation(line: 42, column: 14, scope: !43)
!45 = !DILocation(line: 43, column: 5, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !12, line: 45, type: !48)
!47 = distinct !DILexicalBlock(scope: !20, file: !12, line: 44, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 45, column: 14, scope: !47)
!52 = !DILocation(line: 46, column: 9, scope: !47)
!53 = !DILocation(line: 47, column: 9, scope: !47)
!54 = !DILocation(line: 47, column: 21, scope: !47)
!55 = !DILocation(line: 50, column: 9, scope: !47)
!56 = !DILocation(line: 50, column: 23, scope: !47)
!57 = !DILocation(line: 50, column: 36, scope: !47)
!58 = !DILocation(line: 50, column: 29, scope: !47)
!59 = !DILocation(line: 50, column: 41, scope: !47)
!60 = !DILocation(line: 51, column: 9, scope: !47)
!61 = !DILocation(line: 51, column: 21, scope: !47)
!62 = !DILocation(line: 52, column: 19, scope: !47)
!63 = !DILocation(line: 52, column: 9, scope: !47)
!64 = !DILocation(line: 54, column: 1, scope: !20)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_05_good", scope: !12, file: !12, line: 119, type: !21, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocation(line: 121, column: 5, scope: !65)
!67 = !DILocation(line: 122, column: 5, scope: !65)
!68 = !DILocation(line: 123, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !70, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!13, !13, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !12, line: 135, type: !13)
!74 = !DILocation(line: 135, column: 14, scope: !69)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !12, line: 135, type: !72)
!76 = !DILocation(line: 135, column: 27, scope: !69)
!77 = !DILocation(line: 138, column: 22, scope: !69)
!78 = !DILocation(line: 138, column: 12, scope: !69)
!79 = !DILocation(line: 138, column: 5, scope: !69)
!80 = !DILocation(line: 140, column: 5, scope: !69)
!81 = !DILocation(line: 141, column: 5, scope: !69)
!82 = !DILocation(line: 142, column: 5, scope: !69)
!83 = !DILocation(line: 145, column: 5, scope: !69)
!84 = !DILocation(line: 146, column: 5, scope: !69)
!85 = !DILocation(line: 147, column: 5, scope: !69)
!86 = !DILocation(line: 149, column: 5, scope: !69)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 63, type: !6)
!89 = !DILocation(line: 63, column: 12, scope: !87)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !12, line: 64, type: !6)
!91 = !DILocation(line: 64, column: 12, scope: !87)
!92 = !DILocation(line: 64, column: 36, scope: !87)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !12, line: 65, type: !6)
!94 = !DILocation(line: 65, column: 12, scope: !87)
!95 = !DILocation(line: 65, column: 37, scope: !87)
!96 = !DILocation(line: 66, column: 12, scope: !87)
!97 = !DILocation(line: 66, column: 5, scope: !87)
!98 = !DILocation(line: 67, column: 5, scope: !87)
!99 = !DILocation(line: 67, column: 25, scope: !87)
!100 = !DILocation(line: 68, column: 12, scope: !87)
!101 = !DILocation(line: 68, column: 5, scope: !87)
!102 = !DILocation(line: 69, column: 5, scope: !87)
!103 = !DILocation(line: 69, column: 27, scope: !87)
!104 = !DILocation(line: 70, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !87, file: !12, line: 70, column: 8)
!106 = !DILocation(line: 70, column: 8, scope: !87)
!107 = !DILocation(line: 73, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !12, line: 71, column: 5)
!109 = !DILocation(line: 74, column: 5, scope: !108)
!110 = !DILocation(line: 78, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !105, file: !12, line: 76, column: 5)
!112 = !DILocation(line: 78, column: 14, scope: !111)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !12, line: 81, type: !48)
!114 = distinct !DILexicalBlock(scope: !87, file: !12, line: 80, column: 5)
!115 = !DILocation(line: 81, column: 14, scope: !114)
!116 = !DILocation(line: 82, column: 9, scope: !114)
!117 = !DILocation(line: 83, column: 9, scope: !114)
!118 = !DILocation(line: 83, column: 21, scope: !114)
!119 = !DILocation(line: 86, column: 9, scope: !114)
!120 = !DILocation(line: 86, column: 23, scope: !114)
!121 = !DILocation(line: 86, column: 36, scope: !114)
!122 = !DILocation(line: 86, column: 29, scope: !114)
!123 = !DILocation(line: 86, column: 41, scope: !114)
!124 = !DILocation(line: 87, column: 9, scope: !114)
!125 = !DILocation(line: 87, column: 21, scope: !114)
!126 = !DILocation(line: 88, column: 19, scope: !114)
!127 = !DILocation(line: 88, column: 9, scope: !114)
!128 = !DILocation(line: 90, column: 1, scope: !87)
!129 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !21, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", scope: !129, file: !12, line: 95, type: !6)
!131 = !DILocation(line: 95, column: 12, scope: !129)
!132 = !DILocalVariable(name: "dataBadBuffer", scope: !129, file: !12, line: 96, type: !6)
!133 = !DILocation(line: 96, column: 12, scope: !129)
!134 = !DILocation(line: 96, column: 36, scope: !129)
!135 = !DILocalVariable(name: "dataGoodBuffer", scope: !129, file: !12, line: 97, type: !6)
!136 = !DILocation(line: 97, column: 12, scope: !129)
!137 = !DILocation(line: 97, column: 37, scope: !129)
!138 = !DILocation(line: 98, column: 12, scope: !129)
!139 = !DILocation(line: 98, column: 5, scope: !129)
!140 = !DILocation(line: 99, column: 5, scope: !129)
!141 = !DILocation(line: 99, column: 25, scope: !129)
!142 = !DILocation(line: 100, column: 12, scope: !129)
!143 = !DILocation(line: 100, column: 5, scope: !129)
!144 = !DILocation(line: 101, column: 5, scope: !129)
!145 = !DILocation(line: 101, column: 27, scope: !129)
!146 = !DILocation(line: 102, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !129, file: !12, line: 102, column: 8)
!148 = !DILocation(line: 102, column: 8, scope: !129)
!149 = !DILocation(line: 105, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 103, column: 5)
!151 = !DILocation(line: 105, column: 14, scope: !150)
!152 = !DILocation(line: 106, column: 5, scope: !150)
!153 = !DILocalVariable(name: "dest", scope: !154, file: !12, line: 108, type: !48)
!154 = distinct !DILexicalBlock(scope: !129, file: !12, line: 107, column: 5)
!155 = !DILocation(line: 108, column: 14, scope: !154)
!156 = !DILocation(line: 109, column: 9, scope: !154)
!157 = !DILocation(line: 110, column: 9, scope: !154)
!158 = !DILocation(line: 110, column: 21, scope: !154)
!159 = !DILocation(line: 113, column: 9, scope: !154)
!160 = !DILocation(line: 113, column: 23, scope: !154)
!161 = !DILocation(line: 113, column: 36, scope: !154)
!162 = !DILocation(line: 113, column: 29, scope: !154)
!163 = !DILocation(line: 113, column: 41, scope: !154)
!164 = !DILocation(line: 114, column: 9, scope: !154)
!165 = !DILocation(line: 114, column: 21, scope: !154)
!166 = !DILocation(line: 115, column: 19, scope: !154)
!167 = !DILocation(line: 115, column: 9, scope: !154)
!168 = !DILocation(line: 117, column: 1, scope: !129)
