; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_18_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
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
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  br label %source, !dbg !37

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !38), !dbg !39
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %8, i32** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !55
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !59
  store i64 %call6, i64* %destLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %source
  %9 = load i64, i64* %i, align 8, !dbg !64
  %10 = load i64, i64* %destLen, align 8, !dbg !66
  %cmp = icmp ult i64 %9, %10, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !69
  %12 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !69
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !69
  %14 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !73
  store i32 %13, i32* %arrayidx8, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %15, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !81
  store i32 0, i32* %arrayidx9, align 4, !dbg !82
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !83
  call void @printWLine(i32* %arraydecay10), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_18_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #5, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #5, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_18_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_18_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 200, align 16, !dbg !114
  %1 = bitcast i8* %0 to i32*, !dbg !115
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %2 = alloca i8, i64 400, align 16, !dbg !118
  %3 = bitcast i8* %2 to i32*, !dbg !119
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !117
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !120
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !121
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !124
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !125
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !126
  store i32 0, i32* %arrayidx2, align 4, !dbg !127
  br label %source, !dbg !128

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !129), !dbg !130
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !131
  store i32* %8, i32** %data, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !141
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !142
  store i32 0, i32* %arrayidx4, align 4, !dbg !143
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !145
  store i64 %call6, i64* %destLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %source
  %9 = load i64, i64* %i, align 8, !dbg !150
  %10 = load i64, i64* %destLen, align 8, !dbg !152
  %cmp = icmp ult i64 %9, %10, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !155
  %12 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !155
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !155
  %14 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !159
  store i32 %13, i32* %arrayidx8, align 4, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %15, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !166
  store i32 0, i32* %arrayidx9, align 4, !dbg !167
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  call void @printWLine(i32* %arraydecay10), !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_18.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_18_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_18.c", directory: "/root/SSE-Assessment")
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
!37 = !DILocation(line: 32, column: 5, scope: !15)
!38 = !DILabel(scope: !15, name: "source", file: !16, line: 33)
!39 = !DILocation(line: 33, column: 1, scope: !15)
!40 = !DILocation(line: 35, column: 12, scope: !15)
!41 = !DILocation(line: 35, column: 10, scope: !15)
!42 = !DILocalVariable(name: "i", scope: !43, file: !16, line: 37, type: !44)
!43 = distinct !DILexicalBlock(scope: !15, file: !16, line: 36, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 37, column: 16, scope: !43)
!47 = !DILocalVariable(name: "destLen", scope: !43, file: !16, line: 37, type: !44)
!48 = !DILocation(line: 37, column: 19, scope: !43)
!49 = !DILocalVariable(name: "dest", scope: !43, file: !16, line: 38, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 38, column: 17, scope: !43)
!54 = !DILocation(line: 39, column: 17, scope: !43)
!55 = !DILocation(line: 39, column: 9, scope: !43)
!56 = !DILocation(line: 40, column: 9, scope: !43)
!57 = !DILocation(line: 40, column: 21, scope: !43)
!58 = !DILocation(line: 41, column: 26, scope: !43)
!59 = !DILocation(line: 41, column: 19, scope: !43)
!60 = !DILocation(line: 41, column: 17, scope: !43)
!61 = !DILocation(line: 44, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !43, file: !16, line: 44, column: 9)
!63 = !DILocation(line: 44, column: 14, scope: !62)
!64 = !DILocation(line: 44, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !16, line: 44, column: 9)
!66 = !DILocation(line: 44, column: 25, scope: !65)
!67 = !DILocation(line: 44, column: 23, scope: !65)
!68 = !DILocation(line: 44, column: 9, scope: !62)
!69 = !DILocation(line: 46, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !16, line: 45, column: 9)
!71 = !DILocation(line: 46, column: 28, scope: !70)
!72 = !DILocation(line: 46, column: 18, scope: !70)
!73 = !DILocation(line: 46, column: 13, scope: !70)
!74 = !DILocation(line: 46, column: 21, scope: !70)
!75 = !DILocation(line: 47, column: 9, scope: !70)
!76 = !DILocation(line: 44, column: 35, scope: !65)
!77 = !DILocation(line: 44, column: 9, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 47, column: 9, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 48, column: 9, scope: !43)
!82 = !DILocation(line: 48, column: 21, scope: !43)
!83 = !DILocation(line: 49, column: 20, scope: !43)
!84 = !DILocation(line: 49, column: 9, scope: !43)
!85 = !DILocation(line: 51, column: 1, scope: !15)
!86 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_18_good", scope: !16, file: !16, line: 88, type: !17, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 90, column: 5, scope: !86)
!88 = !DILocation(line: 91, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 103, type: !90, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!7, !7, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !16, line: 103, type: !7)
!96 = !DILocation(line: 103, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !16, line: 103, type: !92)
!98 = !DILocation(line: 103, column: 27, scope: !89)
!99 = !DILocation(line: 106, column: 22, scope: !89)
!100 = !DILocation(line: 106, column: 12, scope: !89)
!101 = !DILocation(line: 106, column: 5, scope: !89)
!102 = !DILocation(line: 108, column: 5, scope: !89)
!103 = !DILocation(line: 109, column: 5, scope: !89)
!104 = !DILocation(line: 110, column: 5, scope: !89)
!105 = !DILocation(line: 113, column: 5, scope: !89)
!106 = !DILocation(line: 114, column: 5, scope: !89)
!107 = !DILocation(line: 115, column: 5, scope: !89)
!108 = !DILocation(line: 117, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 58, type: !17, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !16, line: 60, type: !4)
!111 = !DILocation(line: 60, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !16, line: 61, type: !4)
!113 = !DILocation(line: 61, column: 15, scope: !109)
!114 = !DILocation(line: 61, column: 42, scope: !109)
!115 = !DILocation(line: 61, column: 31, scope: !109)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !16, line: 62, type: !4)
!117 = !DILocation(line: 62, column: 15, scope: !109)
!118 = !DILocation(line: 62, column: 43, scope: !109)
!119 = !DILocation(line: 62, column: 32, scope: !109)
!120 = !DILocation(line: 63, column: 13, scope: !109)
!121 = !DILocation(line: 63, column: 5, scope: !109)
!122 = !DILocation(line: 64, column: 5, scope: !109)
!123 = !DILocation(line: 64, column: 25, scope: !109)
!124 = !DILocation(line: 65, column: 13, scope: !109)
!125 = !DILocation(line: 65, column: 5, scope: !109)
!126 = !DILocation(line: 66, column: 5, scope: !109)
!127 = !DILocation(line: 66, column: 27, scope: !109)
!128 = !DILocation(line: 67, column: 5, scope: !109)
!129 = !DILabel(scope: !109, name: "source", file: !16, line: 68)
!130 = !DILocation(line: 68, column: 1, scope: !109)
!131 = !DILocation(line: 70, column: 12, scope: !109)
!132 = !DILocation(line: 70, column: 10, scope: !109)
!133 = !DILocalVariable(name: "i", scope: !134, file: !16, line: 72, type: !44)
!134 = distinct !DILexicalBlock(scope: !109, file: !16, line: 71, column: 5)
!135 = !DILocation(line: 72, column: 16, scope: !134)
!136 = !DILocalVariable(name: "destLen", scope: !134, file: !16, line: 72, type: !44)
!137 = !DILocation(line: 72, column: 19, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !134, file: !16, line: 73, type: !50)
!139 = !DILocation(line: 73, column: 17, scope: !134)
!140 = !DILocation(line: 74, column: 17, scope: !134)
!141 = !DILocation(line: 74, column: 9, scope: !134)
!142 = !DILocation(line: 75, column: 9, scope: !134)
!143 = !DILocation(line: 75, column: 21, scope: !134)
!144 = !DILocation(line: 76, column: 26, scope: !134)
!145 = !DILocation(line: 76, column: 19, scope: !134)
!146 = !DILocation(line: 76, column: 17, scope: !134)
!147 = !DILocation(line: 79, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !134, file: !16, line: 79, column: 9)
!149 = !DILocation(line: 79, column: 14, scope: !148)
!150 = !DILocation(line: 79, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !16, line: 79, column: 9)
!152 = !DILocation(line: 79, column: 25, scope: !151)
!153 = !DILocation(line: 79, column: 23, scope: !151)
!154 = !DILocation(line: 79, column: 9, scope: !148)
!155 = !DILocation(line: 81, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !16, line: 80, column: 9)
!157 = !DILocation(line: 81, column: 28, scope: !156)
!158 = !DILocation(line: 81, column: 18, scope: !156)
!159 = !DILocation(line: 81, column: 13, scope: !156)
!160 = !DILocation(line: 81, column: 21, scope: !156)
!161 = !DILocation(line: 82, column: 9, scope: !156)
!162 = !DILocation(line: 79, column: 35, scope: !151)
!163 = !DILocation(line: 79, column: 9, scope: !151)
!164 = distinct !{!164, !154, !165, !80}
!165 = !DILocation(line: 82, column: 9, scope: !148)
!166 = !DILocation(line: 83, column: 9, scope: !134)
!167 = !DILocation(line: 83, column: 21, scope: !134)
!168 = !DILocation(line: 84, column: 20, scope: !134)
!169 = !DILocation(line: 84, column: 9, scope: !134)
!170 = !DILocation(line: 86, column: 1, scope: !109)
