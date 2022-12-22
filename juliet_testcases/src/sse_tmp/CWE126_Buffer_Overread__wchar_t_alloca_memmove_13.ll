; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_13_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %8 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !37
  %cmp = icmp eq i32 %8, 5, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !41
  store i32* %9, i32** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !52
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx4, align 4, !dbg !54
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !55
  %11 = load i32*, i32** %data, align 8, !dbg !56
  %12 = bitcast i32* %11 to i8*, !dbg !55
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !58
  %mul = mul i64 %call7, 4, !dbg !59
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !55
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx8, align 4, !dbg !61
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* %arraydecay9), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_13_good() #0 !dbg !65 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #6, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #6, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_13_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_13_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 200, align 16, !dbg !94
  %1 = bitcast i8* %0 to i32*, !dbg !95
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %2 = alloca i8, i64 400, align 16, !dbg !98
  %3 = bitcast i8* %2 to i32*, !dbg !99
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !97
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !100
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !101
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !104
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !105
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !106
  store i32 0, i32* %arrayidx2, align 4, !dbg !107
  %8 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !108
  %cmp = icmp ne i32 %8, 5, !dbg !110
  br i1 %cmp, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !115
  store i32* %9, i32** %data, align 8, !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !121
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !122
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx4, align 4, !dbg !124
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !125
  %11 = load i32*, i32** %data, align 8, !dbg !126
  %12 = bitcast i32* %11 to i8*, !dbg !125
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !128
  %mul = mul i64 %call7, 4, !dbg !129
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !125
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx8, align 4, !dbg !131
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  call void @printWLine(i32* %arraydecay9), !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !135 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %0 = alloca i8, i64 200, align 16, !dbg !140
  %1 = bitcast i8* %0 to i32*, !dbg !141
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %2 = alloca i8, i64 400, align 16, !dbg !144
  %3 = bitcast i8* %2 to i32*, !dbg !145
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !143
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !146
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !147
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !150
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !151
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !152
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !152
  store i32 0, i32* %arrayidx2, align 4, !dbg !153
  %8 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !154
  %cmp = icmp eq i32 %8, 5, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !158
  store i32* %9, i32** %data, align 8, !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !162, metadata !DIExpression()), !dbg !164
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !165
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !166
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !167
  store i32 0, i32* %arrayidx4, align 4, !dbg !168
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !169
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !169
  %11 = load i32*, i32** %data, align 8, !dbg !170
  %12 = bitcast i32* %11 to i8*, !dbg !169
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !171
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !172
  %mul = mul i64 %call7, 4, !dbg !173
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !169
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !174
  store i32 0, i32* %arrayidx8, align 4, !dbg !175
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !176
  call void @printWLine(i32* %arraydecay9), !dbg !177
  ret void, !dbg !178
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_13_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_13.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 13, scope: !15)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 25, scope: !15)
!33 = !DILocation(line: 30, column: 13, scope: !15)
!34 = !DILocation(line: 30, column: 5, scope: !15)
!35 = !DILocation(line: 31, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 27, scope: !15)
!37 = !DILocation(line: 32, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 8)
!39 = !DILocation(line: 32, column: 25, scope: !38)
!40 = !DILocation(line: 32, column: 8, scope: !15)
!41 = !DILocation(line: 35, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !16, line: 33, column: 5)
!43 = !DILocation(line: 35, column: 14, scope: !42)
!44 = !DILocation(line: 36, column: 5, scope: !42)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !16, line: 38, type: !47)
!46 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 38, column: 17, scope: !46)
!51 = !DILocation(line: 39, column: 17, scope: !46)
!52 = !DILocation(line: 39, column: 9, scope: !46)
!53 = !DILocation(line: 40, column: 9, scope: !46)
!54 = !DILocation(line: 40, column: 21, scope: !46)
!55 = !DILocation(line: 43, column: 9, scope: !46)
!56 = !DILocation(line: 43, column: 23, scope: !46)
!57 = !DILocation(line: 43, column: 36, scope: !46)
!58 = !DILocation(line: 43, column: 29, scope: !46)
!59 = !DILocation(line: 43, column: 41, scope: !46)
!60 = !DILocation(line: 44, column: 9, scope: !46)
!61 = !DILocation(line: 44, column: 21, scope: !46)
!62 = !DILocation(line: 45, column: 20, scope: !46)
!63 = !DILocation(line: 45, column: 9, scope: !46)
!64 = !DILocation(line: 47, column: 1, scope: !15)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_13_good", scope: !16, file: !16, line: 112, type: !17, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 114, column: 5, scope: !65)
!67 = !DILocation(line: 115, column: 5, scope: !65)
!68 = !DILocation(line: 116, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 128, type: !70, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!7, !7, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !16, line: 128, type: !7)
!76 = !DILocation(line: 128, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !16, line: 128, type: !72)
!78 = !DILocation(line: 128, column: 27, scope: !69)
!79 = !DILocation(line: 131, column: 22, scope: !69)
!80 = !DILocation(line: 131, column: 12, scope: !69)
!81 = !DILocation(line: 131, column: 5, scope: !69)
!82 = !DILocation(line: 133, column: 5, scope: !69)
!83 = !DILocation(line: 134, column: 5, scope: !69)
!84 = !DILocation(line: 135, column: 5, scope: !69)
!85 = !DILocation(line: 138, column: 5, scope: !69)
!86 = !DILocation(line: 139, column: 5, scope: !69)
!87 = !DILocation(line: 140, column: 5, scope: !69)
!88 = !DILocation(line: 142, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !16, line: 56, type: !4)
!91 = !DILocation(line: 56, column: 15, scope: !89)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !16, line: 57, type: !4)
!93 = !DILocation(line: 57, column: 15, scope: !89)
!94 = !DILocation(line: 57, column: 42, scope: !89)
!95 = !DILocation(line: 57, column: 31, scope: !89)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !16, line: 58, type: !4)
!97 = !DILocation(line: 58, column: 15, scope: !89)
!98 = !DILocation(line: 58, column: 43, scope: !89)
!99 = !DILocation(line: 58, column: 32, scope: !89)
!100 = !DILocation(line: 59, column: 13, scope: !89)
!101 = !DILocation(line: 59, column: 5, scope: !89)
!102 = !DILocation(line: 60, column: 5, scope: !89)
!103 = !DILocation(line: 60, column: 25, scope: !89)
!104 = !DILocation(line: 61, column: 13, scope: !89)
!105 = !DILocation(line: 61, column: 5, scope: !89)
!106 = !DILocation(line: 62, column: 5, scope: !89)
!107 = !DILocation(line: 62, column: 27, scope: !89)
!108 = !DILocation(line: 63, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !89, file: !16, line: 63, column: 8)
!110 = !DILocation(line: 63, column: 25, scope: !109)
!111 = !DILocation(line: 63, column: 8, scope: !89)
!112 = !DILocation(line: 66, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !16, line: 64, column: 5)
!114 = !DILocation(line: 67, column: 5, scope: !113)
!115 = !DILocation(line: 71, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !109, file: !16, line: 69, column: 5)
!117 = !DILocation(line: 71, column: 14, scope: !116)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !16, line: 74, type: !47)
!119 = distinct !DILexicalBlock(scope: !89, file: !16, line: 73, column: 5)
!120 = !DILocation(line: 74, column: 17, scope: !119)
!121 = !DILocation(line: 75, column: 17, scope: !119)
!122 = !DILocation(line: 75, column: 9, scope: !119)
!123 = !DILocation(line: 76, column: 9, scope: !119)
!124 = !DILocation(line: 76, column: 21, scope: !119)
!125 = !DILocation(line: 79, column: 9, scope: !119)
!126 = !DILocation(line: 79, column: 23, scope: !119)
!127 = !DILocation(line: 79, column: 36, scope: !119)
!128 = !DILocation(line: 79, column: 29, scope: !119)
!129 = !DILocation(line: 79, column: 41, scope: !119)
!130 = !DILocation(line: 80, column: 9, scope: !119)
!131 = !DILocation(line: 80, column: 21, scope: !119)
!132 = !DILocation(line: 81, column: 20, scope: !119)
!133 = !DILocation(line: 81, column: 9, scope: !119)
!134 = !DILocation(line: 83, column: 1, scope: !89)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocalVariable(name: "data", scope: !135, file: !16, line: 88, type: !4)
!137 = !DILocation(line: 88, column: 15, scope: !135)
!138 = !DILocalVariable(name: "dataBadBuffer", scope: !135, file: !16, line: 89, type: !4)
!139 = !DILocation(line: 89, column: 15, scope: !135)
!140 = !DILocation(line: 89, column: 42, scope: !135)
!141 = !DILocation(line: 89, column: 31, scope: !135)
!142 = !DILocalVariable(name: "dataGoodBuffer", scope: !135, file: !16, line: 90, type: !4)
!143 = !DILocation(line: 90, column: 15, scope: !135)
!144 = !DILocation(line: 90, column: 43, scope: !135)
!145 = !DILocation(line: 90, column: 32, scope: !135)
!146 = !DILocation(line: 91, column: 13, scope: !135)
!147 = !DILocation(line: 91, column: 5, scope: !135)
!148 = !DILocation(line: 92, column: 5, scope: !135)
!149 = !DILocation(line: 92, column: 25, scope: !135)
!150 = !DILocation(line: 93, column: 13, scope: !135)
!151 = !DILocation(line: 93, column: 5, scope: !135)
!152 = !DILocation(line: 94, column: 5, scope: !135)
!153 = !DILocation(line: 94, column: 27, scope: !135)
!154 = !DILocation(line: 95, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !135, file: !16, line: 95, column: 8)
!156 = !DILocation(line: 95, column: 25, scope: !155)
!157 = !DILocation(line: 95, column: 8, scope: !135)
!158 = !DILocation(line: 98, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !16, line: 96, column: 5)
!160 = !DILocation(line: 98, column: 14, scope: !159)
!161 = !DILocation(line: 99, column: 5, scope: !159)
!162 = !DILocalVariable(name: "dest", scope: !163, file: !16, line: 101, type: !47)
!163 = distinct !DILexicalBlock(scope: !135, file: !16, line: 100, column: 5)
!164 = !DILocation(line: 101, column: 17, scope: !163)
!165 = !DILocation(line: 102, column: 17, scope: !163)
!166 = !DILocation(line: 102, column: 9, scope: !163)
!167 = !DILocation(line: 103, column: 9, scope: !163)
!168 = !DILocation(line: 103, column: 21, scope: !163)
!169 = !DILocation(line: 106, column: 9, scope: !163)
!170 = !DILocation(line: 106, column: 23, scope: !163)
!171 = !DILocation(line: 106, column: 36, scope: !163)
!172 = !DILocation(line: 106, column: 29, scope: !163)
!173 = !DILocation(line: 106, column: 41, scope: !163)
!174 = !DILocation(line: 107, column: 9, scope: !163)
!175 = !DILocation(line: 107, column: 21, scope: !163)
!176 = !DILocation(line: 108, column: 20, scope: !163)
!177 = !DILocation(line: 108, column: 9, scope: !163)
!178 = !DILocation(line: 110, column: 1, scope: !135)
