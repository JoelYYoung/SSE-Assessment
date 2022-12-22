; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !35
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !38
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx2, align 1, !dbg !40
  %0 = load i32, i32* @staticTrue, align 4, !dbg !41
  %tobool = icmp ne i32 %0, 0, !dbg !41
  br i1 %tobool, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !44
  store i8* %arraydecay3, i8** %data, align 8, !dbg !46
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx5, align 1, !dbg !53
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %1 = load i8*, i8** %data, align 8, !dbg !55
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !57
  %mul = mul i64 %call, 1, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !54
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx8, align 1, !dbg !60
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  call void @printLine(i8* %arraydecay9), !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_05_good() #0 !dbg !64 {
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
  call void @CWE126_Buffer_Overread__char_declare_memcpy_05_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__char_declare_memcpy_05_bad(), !dbg !83
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
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !93
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !96
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx2, align 1, !dbg !98
  %0 = load i32, i32* @staticFalse, align 4, !dbg !99
  %tobool = icmp ne i32 %0, 0, !dbg !99
  br i1 %tobool, label %if.then, label %if.else, !dbg !101

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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !114
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !137
  %tobool = icmp ne i32 %0, 0, !dbg !137
  br i1 %tobool, label %if.then, label %if.end, !dbg !139

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !140
  store i8* %arraydecay3, i8** %data, align 8, !dbg !142
  br label %if.end, !dbg !143

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !144, metadata !DIExpression()), !dbg !146
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !147
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !148
  store i8 0, i8* %arrayidx5, align 1, !dbg !149
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  %1 = load i8*, i8** %data, align 8, !dbg !151
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !152
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !153
  %mul = mul i64 %call, 1, !dbg !154
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !150
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !155
  store i8 0, i8* %arrayidx8, align 1, !dbg !156
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  call void @printLine(i8* %arraydecay9), !dbg !158
  ret void, !dbg !159
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
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 33, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 34, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 34, column: 10, scope: !18)
!35 = !DILocation(line: 35, column: 5, scope: !18)
!36 = !DILocation(line: 36, column: 5, scope: !18)
!37 = !DILocation(line: 36, column: 25, scope: !18)
!38 = !DILocation(line: 37, column: 5, scope: !18)
!39 = !DILocation(line: 38, column: 5, scope: !18)
!40 = !DILocation(line: 38, column: 27, scope: !18)
!41 = !DILocation(line: 39, column: 8, scope: !42)
!42 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 8)
!43 = !DILocation(line: 39, column: 8, scope: !18)
!44 = !DILocation(line: 42, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !10, line: 40, column: 5)
!46 = !DILocation(line: 42, column: 14, scope: !45)
!47 = !DILocation(line: 43, column: 5, scope: !45)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !10, line: 45, type: !31)
!49 = distinct !DILexicalBlock(scope: !18, file: !10, line: 44, column: 5)
!50 = !DILocation(line: 45, column: 14, scope: !49)
!51 = !DILocation(line: 46, column: 9, scope: !49)
!52 = !DILocation(line: 47, column: 9, scope: !49)
!53 = !DILocation(line: 47, column: 21, scope: !49)
!54 = !DILocation(line: 50, column: 9, scope: !49)
!55 = !DILocation(line: 50, column: 22, scope: !49)
!56 = !DILocation(line: 50, column: 35, scope: !49)
!57 = !DILocation(line: 50, column: 28, scope: !49)
!58 = !DILocation(line: 50, column: 40, scope: !49)
!59 = !DILocation(line: 51, column: 9, scope: !49)
!60 = !DILocation(line: 51, column: 21, scope: !49)
!61 = !DILocation(line: 52, column: 19, scope: !49)
!62 = !DILocation(line: 52, column: 9, scope: !49)
!63 = !DILocation(line: 54, column: 1, scope: !18)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_05_good", scope: !10, file: !10, line: 119, type: !19, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocation(line: 121, column: 5, scope: !64)
!66 = !DILocation(line: 122, column: 5, scope: !64)
!67 = !DILocation(line: 123, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 135, type: !69, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!11, !11, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !10, line: 135, type: !11)
!73 = !DILocation(line: 135, column: 14, scope: !68)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !10, line: 135, type: !71)
!75 = !DILocation(line: 135, column: 27, scope: !68)
!76 = !DILocation(line: 138, column: 22, scope: !68)
!77 = !DILocation(line: 138, column: 12, scope: !68)
!78 = !DILocation(line: 138, column: 5, scope: !68)
!79 = !DILocation(line: 140, column: 5, scope: !68)
!80 = !DILocation(line: 141, column: 5, scope: !68)
!81 = !DILocation(line: 142, column: 5, scope: !68)
!82 = !DILocation(line: 145, column: 5, scope: !68)
!83 = !DILocation(line: 146, column: 5, scope: !68)
!84 = !DILocation(line: 147, column: 5, scope: !68)
!85 = !DILocation(line: 149, column: 5, scope: !68)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !10, line: 63, type: !22)
!88 = !DILocation(line: 63, column: 12, scope: !86)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !10, line: 64, type: !26)
!90 = !DILocation(line: 64, column: 10, scope: !86)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !10, line: 65, type: !31)
!92 = !DILocation(line: 65, column: 10, scope: !86)
!93 = !DILocation(line: 66, column: 5, scope: !86)
!94 = !DILocation(line: 67, column: 5, scope: !86)
!95 = !DILocation(line: 67, column: 25, scope: !86)
!96 = !DILocation(line: 68, column: 5, scope: !86)
!97 = !DILocation(line: 69, column: 5, scope: !86)
!98 = !DILocation(line: 69, column: 27, scope: !86)
!99 = !DILocation(line: 70, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !86, file: !10, line: 70, column: 8)
!101 = !DILocation(line: 70, column: 8, scope: !86)
!102 = !DILocation(line: 73, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !10, line: 71, column: 5)
!104 = !DILocation(line: 74, column: 5, scope: !103)
!105 = !DILocation(line: 78, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !100, file: !10, line: 76, column: 5)
!107 = !DILocation(line: 78, column: 14, scope: !106)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !10, line: 81, type: !31)
!109 = distinct !DILexicalBlock(scope: !86, file: !10, line: 80, column: 5)
!110 = !DILocation(line: 81, column: 14, scope: !109)
!111 = !DILocation(line: 82, column: 9, scope: !109)
!112 = !DILocation(line: 83, column: 9, scope: !109)
!113 = !DILocation(line: 83, column: 21, scope: !109)
!114 = !DILocation(line: 86, column: 9, scope: !109)
!115 = !DILocation(line: 86, column: 22, scope: !109)
!116 = !DILocation(line: 86, column: 35, scope: !109)
!117 = !DILocation(line: 86, column: 28, scope: !109)
!118 = !DILocation(line: 86, column: 40, scope: !109)
!119 = !DILocation(line: 87, column: 9, scope: !109)
!120 = !DILocation(line: 87, column: 21, scope: !109)
!121 = !DILocation(line: 88, column: 19, scope: !109)
!122 = !DILocation(line: 88, column: 9, scope: !109)
!123 = !DILocation(line: 90, column: 1, scope: !86)
!124 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !10, line: 95, type: !22)
!126 = !DILocation(line: 95, column: 12, scope: !124)
!127 = !DILocalVariable(name: "dataBadBuffer", scope: !124, file: !10, line: 96, type: !26)
!128 = !DILocation(line: 96, column: 10, scope: !124)
!129 = !DILocalVariable(name: "dataGoodBuffer", scope: !124, file: !10, line: 97, type: !31)
!130 = !DILocation(line: 97, column: 10, scope: !124)
!131 = !DILocation(line: 98, column: 5, scope: !124)
!132 = !DILocation(line: 99, column: 5, scope: !124)
!133 = !DILocation(line: 99, column: 25, scope: !124)
!134 = !DILocation(line: 100, column: 5, scope: !124)
!135 = !DILocation(line: 101, column: 5, scope: !124)
!136 = !DILocation(line: 101, column: 27, scope: !124)
!137 = !DILocation(line: 102, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !124, file: !10, line: 102, column: 8)
!139 = !DILocation(line: 102, column: 8, scope: !124)
!140 = !DILocation(line: 105, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !10, line: 103, column: 5)
!142 = !DILocation(line: 105, column: 14, scope: !141)
!143 = !DILocation(line: 106, column: 5, scope: !141)
!144 = !DILocalVariable(name: "dest", scope: !145, file: !10, line: 108, type: !31)
!145 = distinct !DILexicalBlock(scope: !124, file: !10, line: 107, column: 5)
!146 = !DILocation(line: 108, column: 14, scope: !145)
!147 = !DILocation(line: 109, column: 9, scope: !145)
!148 = !DILocation(line: 110, column: 9, scope: !145)
!149 = !DILocation(line: 110, column: 21, scope: !145)
!150 = !DILocation(line: 113, column: 9, scope: !145)
!151 = !DILocation(line: 113, column: 22, scope: !145)
!152 = !DILocation(line: 113, column: 35, scope: !145)
!153 = !DILocation(line: 113, column: 28, scope: !145)
!154 = !DILocation(line: 113, column: 40, scope: !145)
!155 = !DILocation(line: 114, column: 9, scope: !145)
!156 = !DILocation(line: 114, column: 21, scope: !145)
!157 = !DILocation(line: 115, column: 19, scope: !145)
!158 = !DILocation(line: 115, column: 9, scope: !145)
!159 = !DILocation(line: 117, column: 1, scope: !124)
