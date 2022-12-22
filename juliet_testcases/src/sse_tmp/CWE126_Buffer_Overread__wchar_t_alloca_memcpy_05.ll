; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !35
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !39
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  %8 = load i32, i32* @staticTrue, align 4, !dbg !42
  %tobool = icmp ne i32 %8, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  store i32* %9, i32** %data, align 8, !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !56
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx4, align 4, !dbg !58
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !59
  %11 = load i32*, i32** %data, align 8, !dbg !60
  %12 = bitcast i32* %11 to i8*, !dbg !59
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !62
  %mul = mul i64 %call7, 4, !dbg !63
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !59
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx8, align 4, !dbg !65
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  call void @printWLine(i32* %arraydecay9), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_05_good() #0 !dbg !69 {
entry:
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #6, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #6, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_05_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_05_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 200, align 16, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !99
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %2 = alloca i8, i64 400, align 16, !dbg !102
  %3 = bitcast i8* %2 to i32*, !dbg !103
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !101
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !104
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !105
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !108
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !109
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !110
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !110
  store i32 0, i32* %arrayidx2, align 4, !dbg !111
  %8 = load i32, i32* @staticFalse, align 4, !dbg !112
  %tobool = icmp ne i32 %8, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !118
  store i32* %9, i32** %data, align 8, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !125
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx4, align 4, !dbg !127
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !128
  %11 = load i32*, i32** %data, align 8, !dbg !129
  %12 = bitcast i32* %11 to i8*, !dbg !128
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !131
  %mul = mul i64 %call7, 4, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !128
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx8, align 4, !dbg !134
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  call void @printWLine(i32* %arraydecay9), !dbg !136
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !138 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %0 = alloca i8, i64 200, align 16, !dbg !143
  %1 = bitcast i8* %0 to i32*, !dbg !144
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  %2 = alloca i8, i64 400, align 16, !dbg !147
  %3 = bitcast i8* %2 to i32*, !dbg !148
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !146
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !149
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !150
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !151
  store i32 0, i32* %arrayidx, align 4, !dbg !152
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !153
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !154
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !155
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !155
  store i32 0, i32* %arrayidx2, align 4, !dbg !156
  %8 = load i32, i32* @staticTrue, align 4, !dbg !157
  %tobool = icmp ne i32 %8, 0, !dbg !157
  br i1 %tobool, label %if.then, label %if.end, !dbg !159

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !160
  store i32* %9, i32** %data, align 8, !dbg !162
  br label %if.end, !dbg !163

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !164, metadata !DIExpression()), !dbg !166
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !168
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx4, align 4, !dbg !170
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !171
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !171
  %11 = load i32*, i32** %data, align 8, !dbg !172
  %12 = bitcast i32* %11 to i8*, !dbg !171
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !174
  %mul = mul i64 %call7, 4, !dbg !175
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !171
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !176
  store i32 0, i32* %arrayidx8, align 4, !dbg !177
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !178
  call void @printWLine(i32* %arraydecay9), !dbg !179
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_05.c", directory: "/root/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 42, scope: !21)
!29 = !DILocation(line: 33, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 34, type: !6)
!31 = !DILocation(line: 34, column: 15, scope: !21)
!32 = !DILocation(line: 34, column: 43, scope: !21)
!33 = !DILocation(line: 34, column: 32, scope: !21)
!34 = !DILocation(line: 35, column: 13, scope: !21)
!35 = !DILocation(line: 35, column: 5, scope: !21)
!36 = !DILocation(line: 36, column: 5, scope: !21)
!37 = !DILocation(line: 36, column: 25, scope: !21)
!38 = !DILocation(line: 37, column: 13, scope: !21)
!39 = !DILocation(line: 37, column: 5, scope: !21)
!40 = !DILocation(line: 38, column: 5, scope: !21)
!41 = !DILocation(line: 38, column: 27, scope: !21)
!42 = !DILocation(line: 39, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !21, file: !14, line: 39, column: 8)
!44 = !DILocation(line: 39, column: 8, scope: !21)
!45 = !DILocation(line: 42, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !14, line: 40, column: 5)
!47 = !DILocation(line: 42, column: 14, scope: !46)
!48 = !DILocation(line: 43, column: 5, scope: !46)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !14, line: 45, type: !51)
!50 = distinct !DILexicalBlock(scope: !21, file: !14, line: 44, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 45, column: 17, scope: !50)
!55 = !DILocation(line: 46, column: 17, scope: !50)
!56 = !DILocation(line: 46, column: 9, scope: !50)
!57 = !DILocation(line: 47, column: 9, scope: !50)
!58 = !DILocation(line: 47, column: 21, scope: !50)
!59 = !DILocation(line: 50, column: 9, scope: !50)
!60 = !DILocation(line: 50, column: 22, scope: !50)
!61 = !DILocation(line: 50, column: 35, scope: !50)
!62 = !DILocation(line: 50, column: 28, scope: !50)
!63 = !DILocation(line: 50, column: 40, scope: !50)
!64 = !DILocation(line: 51, column: 9, scope: !50)
!65 = !DILocation(line: 51, column: 21, scope: !50)
!66 = !DILocation(line: 52, column: 20, scope: !50)
!67 = !DILocation(line: 52, column: 9, scope: !50)
!68 = !DILocation(line: 54, column: 1, scope: !21)
!69 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_05_good", scope: !14, file: !14, line: 119, type: !22, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocation(line: 121, column: 5, scope: !69)
!71 = !DILocation(line: 122, column: 5, scope: !69)
!72 = !DILocation(line: 123, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 135, type: !74, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DISubroutineType(types: !75)
!75 = !{!9, !9, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !14, line: 135, type: !9)
!80 = !DILocation(line: 135, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !14, line: 135, type: !76)
!82 = !DILocation(line: 135, column: 27, scope: !73)
!83 = !DILocation(line: 138, column: 22, scope: !73)
!84 = !DILocation(line: 138, column: 12, scope: !73)
!85 = !DILocation(line: 138, column: 5, scope: !73)
!86 = !DILocation(line: 140, column: 5, scope: !73)
!87 = !DILocation(line: 141, column: 5, scope: !73)
!88 = !DILocation(line: 142, column: 5, scope: !73)
!89 = !DILocation(line: 145, column: 5, scope: !73)
!90 = !DILocation(line: 146, column: 5, scope: !73)
!91 = !DILocation(line: 147, column: 5, scope: !73)
!92 = !DILocation(line: 149, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 63, type: !6)
!95 = !DILocation(line: 63, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !14, line: 64, type: !6)
!97 = !DILocation(line: 64, column: 15, scope: !93)
!98 = !DILocation(line: 64, column: 42, scope: !93)
!99 = !DILocation(line: 64, column: 31, scope: !93)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !14, line: 65, type: !6)
!101 = !DILocation(line: 65, column: 15, scope: !93)
!102 = !DILocation(line: 65, column: 43, scope: !93)
!103 = !DILocation(line: 65, column: 32, scope: !93)
!104 = !DILocation(line: 66, column: 13, scope: !93)
!105 = !DILocation(line: 66, column: 5, scope: !93)
!106 = !DILocation(line: 67, column: 5, scope: !93)
!107 = !DILocation(line: 67, column: 25, scope: !93)
!108 = !DILocation(line: 68, column: 13, scope: !93)
!109 = !DILocation(line: 68, column: 5, scope: !93)
!110 = !DILocation(line: 69, column: 5, scope: !93)
!111 = !DILocation(line: 69, column: 27, scope: !93)
!112 = !DILocation(line: 70, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !93, file: !14, line: 70, column: 8)
!114 = !DILocation(line: 70, column: 8, scope: !93)
!115 = !DILocation(line: 73, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !14, line: 71, column: 5)
!117 = !DILocation(line: 74, column: 5, scope: !116)
!118 = !DILocation(line: 78, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !14, line: 76, column: 5)
!120 = !DILocation(line: 78, column: 14, scope: !119)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !14, line: 81, type: !51)
!122 = distinct !DILexicalBlock(scope: !93, file: !14, line: 80, column: 5)
!123 = !DILocation(line: 81, column: 17, scope: !122)
!124 = !DILocation(line: 82, column: 17, scope: !122)
!125 = !DILocation(line: 82, column: 9, scope: !122)
!126 = !DILocation(line: 83, column: 9, scope: !122)
!127 = !DILocation(line: 83, column: 21, scope: !122)
!128 = !DILocation(line: 86, column: 9, scope: !122)
!129 = !DILocation(line: 86, column: 22, scope: !122)
!130 = !DILocation(line: 86, column: 35, scope: !122)
!131 = !DILocation(line: 86, column: 28, scope: !122)
!132 = !DILocation(line: 86, column: 40, scope: !122)
!133 = !DILocation(line: 87, column: 9, scope: !122)
!134 = !DILocation(line: 87, column: 21, scope: !122)
!135 = !DILocation(line: 88, column: 20, scope: !122)
!136 = !DILocation(line: 88, column: 9, scope: !122)
!137 = !DILocation(line: 90, column: 1, scope: !93)
!138 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 93, type: !22, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!139 = !DILocalVariable(name: "data", scope: !138, file: !14, line: 95, type: !6)
!140 = !DILocation(line: 95, column: 15, scope: !138)
!141 = !DILocalVariable(name: "dataBadBuffer", scope: !138, file: !14, line: 96, type: !6)
!142 = !DILocation(line: 96, column: 15, scope: !138)
!143 = !DILocation(line: 96, column: 42, scope: !138)
!144 = !DILocation(line: 96, column: 31, scope: !138)
!145 = !DILocalVariable(name: "dataGoodBuffer", scope: !138, file: !14, line: 97, type: !6)
!146 = !DILocation(line: 97, column: 15, scope: !138)
!147 = !DILocation(line: 97, column: 43, scope: !138)
!148 = !DILocation(line: 97, column: 32, scope: !138)
!149 = !DILocation(line: 98, column: 13, scope: !138)
!150 = !DILocation(line: 98, column: 5, scope: !138)
!151 = !DILocation(line: 99, column: 5, scope: !138)
!152 = !DILocation(line: 99, column: 25, scope: !138)
!153 = !DILocation(line: 100, column: 13, scope: !138)
!154 = !DILocation(line: 100, column: 5, scope: !138)
!155 = !DILocation(line: 101, column: 5, scope: !138)
!156 = !DILocation(line: 101, column: 27, scope: !138)
!157 = !DILocation(line: 102, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !138, file: !14, line: 102, column: 8)
!159 = !DILocation(line: 102, column: 8, scope: !138)
!160 = !DILocation(line: 105, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !14, line: 103, column: 5)
!162 = !DILocation(line: 105, column: 14, scope: !161)
!163 = !DILocation(line: 106, column: 5, scope: !161)
!164 = !DILocalVariable(name: "dest", scope: !165, file: !14, line: 108, type: !51)
!165 = distinct !DILexicalBlock(scope: !138, file: !14, line: 107, column: 5)
!166 = !DILocation(line: 108, column: 17, scope: !165)
!167 = !DILocation(line: 109, column: 17, scope: !165)
!168 = !DILocation(line: 109, column: 9, scope: !165)
!169 = !DILocation(line: 110, column: 9, scope: !165)
!170 = !DILocation(line: 110, column: 21, scope: !165)
!171 = !DILocation(line: 113, column: 9, scope: !165)
!172 = !DILocation(line: 113, column: 22, scope: !165)
!173 = !DILocation(line: 113, column: 35, scope: !165)
!174 = !DILocation(line: 113, column: 28, scope: !165)
!175 = !DILocation(line: 113, column: 40, scope: !165)
!176 = !DILocation(line: 114, column: 9, scope: !165)
!177 = !DILocation(line: 114, column: 21, scope: !165)
!178 = !DILocation(line: 115, column: 20, scope: !165)
!179 = !DILocation(line: 115, column: 9, scope: !165)
!180 = !DILocation(line: 117, column: 1, scope: !138)
