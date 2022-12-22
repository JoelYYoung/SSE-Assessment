; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_10.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_10_bad() #0 !dbg !15 {
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
  %8 = load i32, i32* @globalTrue, align 4, !dbg !37
  %tobool = icmp ne i32 %8, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %9, i32** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx4, align 4, !dbg !53
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !54
  %11 = load i32*, i32** %data, align 8, !dbg !55
  %12 = bitcast i32* %11 to i8*, !dbg !54
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !57
  %mul = mul i64 %call7, 4, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !54
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx8, align 4, !dbg !60
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  call void @printWLine(i32* %arraydecay9), !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_10_good() #0 !dbg !64 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_10_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_10_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 200, align 16, !dbg !93
  %1 = bitcast i8* %0 to i32*, !dbg !94
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %2 = alloca i8, i64 400, align 16, !dbg !97
  %3 = bitcast i8* %2 to i32*, !dbg !98
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !96
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !99
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !100
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !103
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !104
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !105
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !105
  store i32 0, i32* %arrayidx2, align 4, !dbg !106
  %8 = load i32, i32* @globalFalse, align 4, !dbg !107
  %tobool = icmp ne i32 %8, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !113
  store i32* %9, i32** %data, align 8, !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !120
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx4, align 4, !dbg !122
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !123
  %11 = load i32*, i32** %data, align 8, !dbg !124
  %12 = bitcast i32* %11 to i8*, !dbg !123
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !126
  %mul = mul i64 %call7, 4, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !123
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx8, align 4, !dbg !129
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay9), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  %0 = alloca i8, i64 200, align 16, !dbg !138
  %1 = bitcast i8* %0 to i32*, !dbg !139
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  %2 = alloca i8, i64 400, align 16, !dbg !142
  %3 = bitcast i8* %2 to i32*, !dbg !143
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !141
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !144
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !145
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !146
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !148
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !149
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !150
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !150
  store i32 0, i32* %arrayidx2, align 4, !dbg !151
  %8 = load i32, i32* @globalTrue, align 4, !dbg !152
  %tobool = icmp ne i32 %8, 0, !dbg !152
  br i1 %tobool, label %if.then, label %if.end, !dbg !154

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !155
  store i32* %9, i32** %data, align 8, !dbg !157
  br label %if.end, !dbg !158

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !159, metadata !DIExpression()), !dbg !161
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !162
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !163
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !164
  store i32 0, i32* %arrayidx4, align 4, !dbg !165
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !166
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !166
  %11 = load i32*, i32** %data, align 8, !dbg !167
  %12 = bitcast i32* %11 to i8*, !dbg !166
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !169
  %mul = mul i64 %call7, 4, !dbg !170
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !166
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !171
  store i32 0, i32* %arrayidx8, align 4, !dbg !172
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  call void @printWLine(i32* %arraydecay9), !dbg !174
  ret void, !dbg !175
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_10.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_10_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_10.c", directory: "/root/SSE-Assessment")
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
!39 = !DILocation(line: 32, column: 8, scope: !15)
!40 = !DILocation(line: 35, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !16, line: 33, column: 5)
!42 = !DILocation(line: 35, column: 14, scope: !41)
!43 = !DILocation(line: 36, column: 5, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !16, line: 38, type: !46)
!45 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 38, column: 17, scope: !45)
!50 = !DILocation(line: 39, column: 17, scope: !45)
!51 = !DILocation(line: 39, column: 9, scope: !45)
!52 = !DILocation(line: 40, column: 9, scope: !45)
!53 = !DILocation(line: 40, column: 21, scope: !45)
!54 = !DILocation(line: 43, column: 9, scope: !45)
!55 = !DILocation(line: 43, column: 22, scope: !45)
!56 = !DILocation(line: 43, column: 35, scope: !45)
!57 = !DILocation(line: 43, column: 28, scope: !45)
!58 = !DILocation(line: 43, column: 40, scope: !45)
!59 = !DILocation(line: 44, column: 9, scope: !45)
!60 = !DILocation(line: 44, column: 21, scope: !45)
!61 = !DILocation(line: 45, column: 20, scope: !45)
!62 = !DILocation(line: 45, column: 9, scope: !45)
!63 = !DILocation(line: 47, column: 1, scope: !15)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_10_good", scope: !16, file: !16, line: 112, type: !17, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 114, column: 5, scope: !64)
!66 = !DILocation(line: 115, column: 5, scope: !64)
!67 = !DILocation(line: 116, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 128, type: !69, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !16, line: 128, type: !7)
!75 = !DILocation(line: 128, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !16, line: 128, type: !71)
!77 = !DILocation(line: 128, column: 27, scope: !68)
!78 = !DILocation(line: 131, column: 22, scope: !68)
!79 = !DILocation(line: 131, column: 12, scope: !68)
!80 = !DILocation(line: 131, column: 5, scope: !68)
!81 = !DILocation(line: 133, column: 5, scope: !68)
!82 = !DILocation(line: 134, column: 5, scope: !68)
!83 = !DILocation(line: 135, column: 5, scope: !68)
!84 = !DILocation(line: 138, column: 5, scope: !68)
!85 = !DILocation(line: 139, column: 5, scope: !68)
!86 = !DILocation(line: 140, column: 5, scope: !68)
!87 = !DILocation(line: 142, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !16, line: 56, type: !4)
!90 = !DILocation(line: 56, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !16, line: 57, type: !4)
!92 = !DILocation(line: 57, column: 15, scope: !88)
!93 = !DILocation(line: 57, column: 42, scope: !88)
!94 = !DILocation(line: 57, column: 31, scope: !88)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !16, line: 58, type: !4)
!96 = !DILocation(line: 58, column: 15, scope: !88)
!97 = !DILocation(line: 58, column: 43, scope: !88)
!98 = !DILocation(line: 58, column: 32, scope: !88)
!99 = !DILocation(line: 59, column: 13, scope: !88)
!100 = !DILocation(line: 59, column: 5, scope: !88)
!101 = !DILocation(line: 60, column: 5, scope: !88)
!102 = !DILocation(line: 60, column: 25, scope: !88)
!103 = !DILocation(line: 61, column: 13, scope: !88)
!104 = !DILocation(line: 61, column: 5, scope: !88)
!105 = !DILocation(line: 62, column: 5, scope: !88)
!106 = !DILocation(line: 62, column: 27, scope: !88)
!107 = !DILocation(line: 63, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !88, file: !16, line: 63, column: 8)
!109 = !DILocation(line: 63, column: 8, scope: !88)
!110 = !DILocation(line: 66, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !16, line: 64, column: 5)
!112 = !DILocation(line: 67, column: 5, scope: !111)
!113 = !DILocation(line: 71, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !16, line: 69, column: 5)
!115 = !DILocation(line: 71, column: 14, scope: !114)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !16, line: 74, type: !46)
!117 = distinct !DILexicalBlock(scope: !88, file: !16, line: 73, column: 5)
!118 = !DILocation(line: 74, column: 17, scope: !117)
!119 = !DILocation(line: 75, column: 17, scope: !117)
!120 = !DILocation(line: 75, column: 9, scope: !117)
!121 = !DILocation(line: 76, column: 9, scope: !117)
!122 = !DILocation(line: 76, column: 21, scope: !117)
!123 = !DILocation(line: 79, column: 9, scope: !117)
!124 = !DILocation(line: 79, column: 22, scope: !117)
!125 = !DILocation(line: 79, column: 35, scope: !117)
!126 = !DILocation(line: 79, column: 28, scope: !117)
!127 = !DILocation(line: 79, column: 40, scope: !117)
!128 = !DILocation(line: 80, column: 9, scope: !117)
!129 = !DILocation(line: 80, column: 21, scope: !117)
!130 = !DILocation(line: 81, column: 20, scope: !117)
!131 = !DILocation(line: 81, column: 9, scope: !117)
!132 = !DILocation(line: 83, column: 1, scope: !88)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", scope: !133, file: !16, line: 88, type: !4)
!135 = !DILocation(line: 88, column: 15, scope: !133)
!136 = !DILocalVariable(name: "dataBadBuffer", scope: !133, file: !16, line: 89, type: !4)
!137 = !DILocation(line: 89, column: 15, scope: !133)
!138 = !DILocation(line: 89, column: 42, scope: !133)
!139 = !DILocation(line: 89, column: 31, scope: !133)
!140 = !DILocalVariable(name: "dataGoodBuffer", scope: !133, file: !16, line: 90, type: !4)
!141 = !DILocation(line: 90, column: 15, scope: !133)
!142 = !DILocation(line: 90, column: 43, scope: !133)
!143 = !DILocation(line: 90, column: 32, scope: !133)
!144 = !DILocation(line: 91, column: 13, scope: !133)
!145 = !DILocation(line: 91, column: 5, scope: !133)
!146 = !DILocation(line: 92, column: 5, scope: !133)
!147 = !DILocation(line: 92, column: 25, scope: !133)
!148 = !DILocation(line: 93, column: 13, scope: !133)
!149 = !DILocation(line: 93, column: 5, scope: !133)
!150 = !DILocation(line: 94, column: 5, scope: !133)
!151 = !DILocation(line: 94, column: 27, scope: !133)
!152 = !DILocation(line: 95, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !133, file: !16, line: 95, column: 8)
!154 = !DILocation(line: 95, column: 8, scope: !133)
!155 = !DILocation(line: 98, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !16, line: 96, column: 5)
!157 = !DILocation(line: 98, column: 14, scope: !156)
!158 = !DILocation(line: 99, column: 5, scope: !156)
!159 = !DILocalVariable(name: "dest", scope: !160, file: !16, line: 101, type: !46)
!160 = distinct !DILexicalBlock(scope: !133, file: !16, line: 100, column: 5)
!161 = !DILocation(line: 101, column: 17, scope: !160)
!162 = !DILocation(line: 102, column: 17, scope: !160)
!163 = !DILocation(line: 102, column: 9, scope: !160)
!164 = !DILocation(line: 103, column: 9, scope: !160)
!165 = !DILocation(line: 103, column: 21, scope: !160)
!166 = !DILocation(line: 106, column: 9, scope: !160)
!167 = !DILocation(line: 106, column: 22, scope: !160)
!168 = !DILocation(line: 106, column: 35, scope: !160)
!169 = !DILocation(line: 106, column: 28, scope: !160)
!170 = !DILocation(line: 106, column: 40, scope: !160)
!171 = !DILocation(line: 107, column: 9, scope: !160)
!172 = !DILocation(line: 107, column: 21, scope: !160)
!173 = !DILocation(line: 108, column: 20, scope: !160)
!174 = !DILocation(line: 108, column: 9, scope: !160)
!175 = !DILocation(line: 110, column: 1, scope: !133)
