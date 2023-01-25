; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 200, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 400, align 16, !dbg !29
  %3 = bitcast i8* %2 to i32*, !dbg !30
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !28
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !32
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !36
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !37
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !37
  store i32 0, i32* %arrayidx2, align 4, !dbg !38
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %i, align 4, !dbg !42
  %cmp = icmp slt i32 %8, 1, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !46
  store i32* %9, i32** %data, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %10, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !55, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !62
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx4, align 4, !dbg !64
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  %11 = bitcast i32* %arraydecay5 to i8*, !dbg !65
  %12 = load i32*, i32** %data, align 8, !dbg !66
  %13 = bitcast i32* %12 to i8*, !dbg !65
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !68
  %mul = mul i64 %call7, 4, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %11, i8* align 4 %13, i64 %mul, i1 false), !dbg !65
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !70
  store i32 0, i32* %arrayidx8, align 4, !dbg !71
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  call void @printWLine(i32* %arraydecay9), !dbg !73
  ret void, !dbg !74
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #6, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #6, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 200, align 16, !dbg !105
  %1 = bitcast i8* %0 to i32*, !dbg !106
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %2 = alloca i8, i64 400, align 16, !dbg !109
  %3 = bitcast i8* %2 to i32*, !dbg !110
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !108
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !111
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !112
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !115
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !116
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !117
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !117
  store i32 0, i32* %arrayidx2, align 4, !dbg !118
  store i32 0, i32* %h, align 4, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %h, align 4, !dbg !122
  %cmp = icmp slt i32 %8, 1, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !126
  store i32* %9, i32** %data, align 8, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %h, align 4, !dbg !130
  %inc = add nsw i32 %10, 1, !dbg !130
  store i32 %inc, i32* %h, align 4, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !137
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !138
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !139
  store i32 0, i32* %arrayidx4, align 4, !dbg !140
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !141
  %11 = bitcast i32* %arraydecay5 to i8*, !dbg !141
  %12 = load i32*, i32** %data, align 8, !dbg !142
  %13 = bitcast i32* %12 to i8*, !dbg !141
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !144
  %mul = mul i64 %call7, 4, !dbg !145
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %11, i8* align 4 %13, i64 %mul, i1 false), !dbg !141
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx8, align 4, !dbg !147
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  call void @printWLine(i32* %arraydecay9), !dbg !149
  ret void, !dbg !150
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 25, type: !7)
!20 = !DILocation(line: 25, column: 9, scope: !15)
!21 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 27, type: !4)
!24 = !DILocation(line: 27, column: 15, scope: !15)
!25 = !DILocation(line: 27, column: 42, scope: !15)
!26 = !DILocation(line: 27, column: 31, scope: !15)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 28, type: !4)
!28 = !DILocation(line: 28, column: 15, scope: !15)
!29 = !DILocation(line: 28, column: 43, scope: !15)
!30 = !DILocation(line: 28, column: 32, scope: !15)
!31 = !DILocation(line: 29, column: 13, scope: !15)
!32 = !DILocation(line: 29, column: 5, scope: !15)
!33 = !DILocation(line: 30, column: 5, scope: !15)
!34 = !DILocation(line: 30, column: 25, scope: !15)
!35 = !DILocation(line: 31, column: 13, scope: !15)
!36 = !DILocation(line: 31, column: 5, scope: !15)
!37 = !DILocation(line: 32, column: 5, scope: !15)
!38 = !DILocation(line: 32, column: 27, scope: !15)
!39 = !DILocation(line: 33, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 5)
!41 = !DILocation(line: 33, column: 9, scope: !40)
!42 = !DILocation(line: 33, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !16, line: 33, column: 5)
!44 = !DILocation(line: 33, column: 18, scope: !43)
!45 = !DILocation(line: 33, column: 5, scope: !40)
!46 = !DILocation(line: 36, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !16, line: 34, column: 5)
!48 = !DILocation(line: 36, column: 14, scope: !47)
!49 = !DILocation(line: 37, column: 5, scope: !47)
!50 = !DILocation(line: 33, column: 24, scope: !43)
!51 = !DILocation(line: 33, column: 5, scope: !43)
!52 = distinct !{!52, !45, !53, !54}
!53 = !DILocation(line: 37, column: 5, scope: !40)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocalVariable(name: "dest", scope: !56, file: !16, line: 39, type: !57)
!56 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 39, column: 17, scope: !56)
!61 = !DILocation(line: 40, column: 17, scope: !56)
!62 = !DILocation(line: 40, column: 9, scope: !56)
!63 = !DILocation(line: 41, column: 9, scope: !56)
!64 = !DILocation(line: 41, column: 21, scope: !56)
!65 = !DILocation(line: 44, column: 9, scope: !56)
!66 = !DILocation(line: 44, column: 22, scope: !56)
!67 = !DILocation(line: 44, column: 35, scope: !56)
!68 = !DILocation(line: 44, column: 28, scope: !56)
!69 = !DILocation(line: 44, column: 40, scope: !56)
!70 = !DILocation(line: 45, column: 9, scope: !56)
!71 = !DILocation(line: 45, column: 21, scope: !56)
!72 = !DILocation(line: 46, column: 20, scope: !56)
!73 = !DILocation(line: 46, column: 9, scope: !56)
!74 = !DILocation(line: 48, column: 1, scope: !15)
!75 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_good", scope: !16, file: !16, line: 82, type: !17, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 84, column: 5, scope: !75)
!77 = !DILocation(line: 85, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 97, type: !79, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!7, !7, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !16, line: 97, type: !7)
!85 = !DILocation(line: 97, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !16, line: 97, type: !81)
!87 = !DILocation(line: 97, column: 27, scope: !78)
!88 = !DILocation(line: 100, column: 22, scope: !78)
!89 = !DILocation(line: 100, column: 12, scope: !78)
!90 = !DILocation(line: 100, column: 5, scope: !78)
!91 = !DILocation(line: 102, column: 5, scope: !78)
!92 = !DILocation(line: 103, column: 5, scope: !78)
!93 = !DILocation(line: 104, column: 5, scope: !78)
!94 = !DILocation(line: 107, column: 5, scope: !78)
!95 = !DILocation(line: 108, column: 5, scope: !78)
!96 = !DILocation(line: 109, column: 5, scope: !78)
!97 = !DILocation(line: 111, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "h", scope: !98, file: !16, line: 57, type: !7)
!100 = !DILocation(line: 57, column: 9, scope: !98)
!101 = !DILocalVariable(name: "data", scope: !98, file: !16, line: 58, type: !4)
!102 = !DILocation(line: 58, column: 15, scope: !98)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !16, line: 59, type: !4)
!104 = !DILocation(line: 59, column: 15, scope: !98)
!105 = !DILocation(line: 59, column: 42, scope: !98)
!106 = !DILocation(line: 59, column: 31, scope: !98)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !16, line: 60, type: !4)
!108 = !DILocation(line: 60, column: 15, scope: !98)
!109 = !DILocation(line: 60, column: 43, scope: !98)
!110 = !DILocation(line: 60, column: 32, scope: !98)
!111 = !DILocation(line: 61, column: 13, scope: !98)
!112 = !DILocation(line: 61, column: 5, scope: !98)
!113 = !DILocation(line: 62, column: 5, scope: !98)
!114 = !DILocation(line: 62, column: 25, scope: !98)
!115 = !DILocation(line: 63, column: 13, scope: !98)
!116 = !DILocation(line: 63, column: 5, scope: !98)
!117 = !DILocation(line: 64, column: 5, scope: !98)
!118 = !DILocation(line: 64, column: 27, scope: !98)
!119 = !DILocation(line: 65, column: 11, scope: !120)
!120 = distinct !DILexicalBlock(scope: !98, file: !16, line: 65, column: 5)
!121 = !DILocation(line: 65, column: 9, scope: !120)
!122 = !DILocation(line: 65, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !16, line: 65, column: 5)
!124 = !DILocation(line: 65, column: 18, scope: !123)
!125 = !DILocation(line: 65, column: 5, scope: !120)
!126 = !DILocation(line: 68, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !16, line: 66, column: 5)
!128 = !DILocation(line: 68, column: 14, scope: !127)
!129 = !DILocation(line: 69, column: 5, scope: !127)
!130 = !DILocation(line: 65, column: 24, scope: !123)
!131 = !DILocation(line: 65, column: 5, scope: !123)
!132 = distinct !{!132, !125, !133, !54}
!133 = !DILocation(line: 69, column: 5, scope: !120)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !16, line: 71, type: !57)
!135 = distinct !DILexicalBlock(scope: !98, file: !16, line: 70, column: 5)
!136 = !DILocation(line: 71, column: 17, scope: !135)
!137 = !DILocation(line: 72, column: 17, scope: !135)
!138 = !DILocation(line: 72, column: 9, scope: !135)
!139 = !DILocation(line: 73, column: 9, scope: !135)
!140 = !DILocation(line: 73, column: 21, scope: !135)
!141 = !DILocation(line: 76, column: 9, scope: !135)
!142 = !DILocation(line: 76, column: 22, scope: !135)
!143 = !DILocation(line: 76, column: 35, scope: !135)
!144 = !DILocation(line: 76, column: 28, scope: !135)
!145 = !DILocation(line: 76, column: 40, scope: !135)
!146 = !DILocation(line: 77, column: 9, scope: !135)
!147 = !DILocation(line: 77, column: 21, scope: !135)
!148 = !DILocation(line: 78, column: 20, scope: !135)
!149 = !DILocation(line: 78, column: 9, scope: !135)
!150 = !DILocation(line: 80, column: 1, scope: !98)
