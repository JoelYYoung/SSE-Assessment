; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !33
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !37
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !38
  store i32 0, i32* %arrayidx2, align 4, !dbg !39
  %8 = load i32, i32* @staticFive, align 4, !dbg !40
  %cmp = icmp eq i32 %8, 5, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !44
  store i32* %9, i32** %data, align 8, !dbg !46
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !55
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !58
  %11 = load i32*, i32** %data, align 8, !dbg !59
  %12 = bitcast i32* %11 to i8*, !dbg !58
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !61
  %mul = mul i64 %call7, 4, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !58
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx8, align 4, !dbg !64
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  call void @printWLine(i32* %arraydecay9), !dbg !66
  ret void, !dbg !67
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #6, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #6, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 200, align 16, !dbg !97
  %1 = bitcast i8* %0 to i32*, !dbg !98
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %2 = alloca i8, i64 400, align 16, !dbg !101
  %3 = bitcast i8* %2 to i32*, !dbg !102
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !100
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !104
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !107
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !108
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !109
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !109
  store i32 0, i32* %arrayidx2, align 4, !dbg !110
  %8 = load i32, i32* @staticFive, align 4, !dbg !111
  %cmp = icmp ne i32 %8, 5, !dbg !113
  br i1 %cmp, label %if.then, label %if.else, !dbg !114

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
  %8 = load i32, i32* @staticFive, align 4, !dbg !157
  %cmp = icmp eq i32 %8, 5, !dbg !159
  br i1 %cmp, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !161
  store i32* %9, i32** %data, align 8, !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !165, metadata !DIExpression()), !dbg !167
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !169
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx4, align 4, !dbg !171
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !172
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !172
  %11 = load i32*, i32** %data, align 8, !dbg !173
  %12 = bitcast i32* %11 to i8*, !dbg !172
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !174
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !175
  %mul = mul i64 %call7, 4, !dbg !176
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !172
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !177
  store i32 0, i32* %arrayidx8, align 4, !dbg !178
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !179
  call void @printWLine(i32* %arraydecay9), !dbg !180
  ret void, !dbg !181
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
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !19)
!26 = !DILocation(line: 32, column: 42, scope: !19)
!27 = !DILocation(line: 32, column: 31, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 33, type: !6)
!29 = !DILocation(line: 33, column: 15, scope: !19)
!30 = !DILocation(line: 33, column: 43, scope: !19)
!31 = !DILocation(line: 33, column: 32, scope: !19)
!32 = !DILocation(line: 34, column: 13, scope: !19)
!33 = !DILocation(line: 34, column: 5, scope: !19)
!34 = !DILocation(line: 35, column: 5, scope: !19)
!35 = !DILocation(line: 35, column: 25, scope: !19)
!36 = !DILocation(line: 36, column: 13, scope: !19)
!37 = !DILocation(line: 36, column: 5, scope: !19)
!38 = !DILocation(line: 37, column: 5, scope: !19)
!39 = !DILocation(line: 37, column: 27, scope: !19)
!40 = !DILocation(line: 38, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !19, file: !12, line: 38, column: 8)
!42 = !DILocation(line: 38, column: 18, scope: !41)
!43 = !DILocation(line: 38, column: 8, scope: !19)
!44 = !DILocation(line: 41, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 39, column: 5)
!46 = !DILocation(line: 41, column: 14, scope: !45)
!47 = !DILocation(line: 42, column: 5, scope: !45)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 44, type: !50)
!49 = distinct !DILexicalBlock(scope: !19, file: !12, line: 43, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 44, column: 17, scope: !49)
!54 = !DILocation(line: 45, column: 17, scope: !49)
!55 = !DILocation(line: 45, column: 9, scope: !49)
!56 = !DILocation(line: 46, column: 9, scope: !49)
!57 = !DILocation(line: 46, column: 21, scope: !49)
!58 = !DILocation(line: 49, column: 9, scope: !49)
!59 = !DILocation(line: 49, column: 22, scope: !49)
!60 = !DILocation(line: 49, column: 35, scope: !49)
!61 = !DILocation(line: 49, column: 28, scope: !49)
!62 = !DILocation(line: 49, column: 40, scope: !49)
!63 = !DILocation(line: 50, column: 9, scope: !49)
!64 = !DILocation(line: 50, column: 21, scope: !49)
!65 = !DILocation(line: 51, column: 20, scope: !49)
!66 = !DILocation(line: 51, column: 9, scope: !49)
!67 = !DILocation(line: 53, column: 1, scope: !19)
!68 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_good", scope: !12, file: !12, line: 118, type: !20, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 120, column: 5, scope: !68)
!70 = !DILocation(line: 121, column: 5, scope: !68)
!71 = !DILocation(line: 122, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 134, type: !73, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!9, !9, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 134, type: !9)
!79 = !DILocation(line: 134, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 134, type: !75)
!81 = !DILocation(line: 134, column: 27, scope: !72)
!82 = !DILocation(line: 137, column: 22, scope: !72)
!83 = !DILocation(line: 137, column: 12, scope: !72)
!84 = !DILocation(line: 137, column: 5, scope: !72)
!85 = !DILocation(line: 139, column: 5, scope: !72)
!86 = !DILocation(line: 140, column: 5, scope: !72)
!87 = !DILocation(line: 141, column: 5, scope: !72)
!88 = !DILocation(line: 144, column: 5, scope: !72)
!89 = !DILocation(line: 145, column: 5, scope: !72)
!90 = !DILocation(line: 146, column: 5, scope: !72)
!91 = !DILocation(line: 148, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !20, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 62, type: !6)
!94 = !DILocation(line: 62, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !12, line: 63, type: !6)
!96 = !DILocation(line: 63, column: 15, scope: !92)
!97 = !DILocation(line: 63, column: 42, scope: !92)
!98 = !DILocation(line: 63, column: 31, scope: !92)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !12, line: 64, type: !6)
!100 = !DILocation(line: 64, column: 15, scope: !92)
!101 = !DILocation(line: 64, column: 43, scope: !92)
!102 = !DILocation(line: 64, column: 32, scope: !92)
!103 = !DILocation(line: 65, column: 13, scope: !92)
!104 = !DILocation(line: 65, column: 5, scope: !92)
!105 = !DILocation(line: 66, column: 5, scope: !92)
!106 = !DILocation(line: 66, column: 25, scope: !92)
!107 = !DILocation(line: 67, column: 13, scope: !92)
!108 = !DILocation(line: 67, column: 5, scope: !92)
!109 = !DILocation(line: 68, column: 5, scope: !92)
!110 = !DILocation(line: 68, column: 27, scope: !92)
!111 = !DILocation(line: 69, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !92, file: !12, line: 69, column: 8)
!113 = !DILocation(line: 69, column: 18, scope: !112)
!114 = !DILocation(line: 69, column: 8, scope: !92)
!115 = !DILocation(line: 72, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !12, line: 70, column: 5)
!117 = !DILocation(line: 73, column: 5, scope: !116)
!118 = !DILocation(line: 77, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !12, line: 75, column: 5)
!120 = !DILocation(line: 77, column: 14, scope: !119)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !12, line: 80, type: !50)
!122 = distinct !DILexicalBlock(scope: !92, file: !12, line: 79, column: 5)
!123 = !DILocation(line: 80, column: 17, scope: !122)
!124 = !DILocation(line: 81, column: 17, scope: !122)
!125 = !DILocation(line: 81, column: 9, scope: !122)
!126 = !DILocation(line: 82, column: 9, scope: !122)
!127 = !DILocation(line: 82, column: 21, scope: !122)
!128 = !DILocation(line: 85, column: 9, scope: !122)
!129 = !DILocation(line: 85, column: 22, scope: !122)
!130 = !DILocation(line: 85, column: 35, scope: !122)
!131 = !DILocation(line: 85, column: 28, scope: !122)
!132 = !DILocation(line: 85, column: 40, scope: !122)
!133 = !DILocation(line: 86, column: 9, scope: !122)
!134 = !DILocation(line: 86, column: 21, scope: !122)
!135 = !DILocation(line: 87, column: 20, scope: !122)
!136 = !DILocation(line: 87, column: 9, scope: !122)
!137 = !DILocation(line: 89, column: 1, scope: !92)
!138 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 92, type: !20, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!139 = !DILocalVariable(name: "data", scope: !138, file: !12, line: 94, type: !6)
!140 = !DILocation(line: 94, column: 15, scope: !138)
!141 = !DILocalVariable(name: "dataBadBuffer", scope: !138, file: !12, line: 95, type: !6)
!142 = !DILocation(line: 95, column: 15, scope: !138)
!143 = !DILocation(line: 95, column: 42, scope: !138)
!144 = !DILocation(line: 95, column: 31, scope: !138)
!145 = !DILocalVariable(name: "dataGoodBuffer", scope: !138, file: !12, line: 96, type: !6)
!146 = !DILocation(line: 96, column: 15, scope: !138)
!147 = !DILocation(line: 96, column: 43, scope: !138)
!148 = !DILocation(line: 96, column: 32, scope: !138)
!149 = !DILocation(line: 97, column: 13, scope: !138)
!150 = !DILocation(line: 97, column: 5, scope: !138)
!151 = !DILocation(line: 98, column: 5, scope: !138)
!152 = !DILocation(line: 98, column: 25, scope: !138)
!153 = !DILocation(line: 99, column: 13, scope: !138)
!154 = !DILocation(line: 99, column: 5, scope: !138)
!155 = !DILocation(line: 100, column: 5, scope: !138)
!156 = !DILocation(line: 100, column: 27, scope: !138)
!157 = !DILocation(line: 101, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !138, file: !12, line: 101, column: 8)
!159 = !DILocation(line: 101, column: 18, scope: !158)
!160 = !DILocation(line: 101, column: 8, scope: !138)
!161 = !DILocation(line: 104, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 102, column: 5)
!163 = !DILocation(line: 104, column: 14, scope: !162)
!164 = !DILocation(line: 105, column: 5, scope: !162)
!165 = !DILocalVariable(name: "dest", scope: !166, file: !12, line: 107, type: !50)
!166 = distinct !DILexicalBlock(scope: !138, file: !12, line: 106, column: 5)
!167 = !DILocation(line: 107, column: 17, scope: !166)
!168 = !DILocation(line: 108, column: 17, scope: !166)
!169 = !DILocation(line: 108, column: 9, scope: !166)
!170 = !DILocation(line: 109, column: 9, scope: !166)
!171 = !DILocation(line: 109, column: 21, scope: !166)
!172 = !DILocation(line: 112, column: 9, scope: !166)
!173 = !DILocation(line: 112, column: 22, scope: !166)
!174 = !DILocation(line: 112, column: 35, scope: !166)
!175 = !DILocation(line: 112, column: 28, scope: !166)
!176 = !DILocation(line: 112, column: 40, scope: !166)
!177 = !DILocation(line: 113, column: 9, scope: !166)
!178 = !DILocation(line: 113, column: 21, scope: !166)
!179 = !DILocation(line: 114, column: 20, scope: !166)
!180 = !DILocation(line: 114, column: 9, scope: !166)
!181 = !DILocation(line: 116, column: 1, scope: !138)
