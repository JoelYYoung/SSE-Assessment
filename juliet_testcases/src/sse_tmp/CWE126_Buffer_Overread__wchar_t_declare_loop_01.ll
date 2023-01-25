; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !32
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !36
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay4, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !51
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx7, align 4, !dbg !53
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !55
  store i64 %call9, i64* %destLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !60
  %1 = load i64, i64* %destLen, align 8, !dbg !62
  %cmp = icmp ult i64 %0, %1, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !65
  %3 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !65
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !65
  %5 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !69
  store i32 %4, i32* %arrayidx11, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %6, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx12, align 4, !dbg !78
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !79
  call void @printWLine(i32* %arraydecay13), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_01_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #5, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #5, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_01_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_01_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !112
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !113
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !117
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx3, align 4, !dbg !119
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  store i32* %arraydecay4, i32** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !130
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx7, align 4, !dbg !132
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !134
  store i64 %call9, i64* %destLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !139
  %1 = load i64, i64* %destLen, align 8, !dbg !141
  %cmp = icmp ult i64 %0, %1, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !144
  %3 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !144
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !144
  %5 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !148
  store i32 %4, i32* %arrayidx11, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %6, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !155
  store i32 0, i32* %arrayidx12, align 4, !dbg !156
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !157
  call void @printWLine(i32* %arraydecay13), !dbg !158
  ret void, !dbg !159
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 5, scope: !11)
!33 = !DILocation(line: 29, column: 5, scope: !11)
!34 = !DILocation(line: 29, column: 25, scope: !11)
!35 = !DILocation(line: 30, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 27, scope: !11)
!39 = !DILocation(line: 33, column: 12, scope: !11)
!40 = !DILocation(line: 33, column: 10, scope: !11)
!41 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 35, column: 16, scope: !42)
!46 = !DILocalVariable(name: "destLen", scope: !42, file: !12, line: 35, type: !43)
!47 = !DILocation(line: 35, column: 19, scope: !42)
!48 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 36, type: !27)
!49 = !DILocation(line: 36, column: 17, scope: !42)
!50 = !DILocation(line: 37, column: 17, scope: !42)
!51 = !DILocation(line: 37, column: 9, scope: !42)
!52 = !DILocation(line: 38, column: 9, scope: !42)
!53 = !DILocation(line: 38, column: 21, scope: !42)
!54 = !DILocation(line: 39, column: 26, scope: !42)
!55 = !DILocation(line: 39, column: 19, scope: !42)
!56 = !DILocation(line: 39, column: 17, scope: !42)
!57 = !DILocation(line: 42, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !42, file: !12, line: 42, column: 9)
!59 = !DILocation(line: 42, column: 14, scope: !58)
!60 = !DILocation(line: 42, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 42, column: 9)
!62 = !DILocation(line: 42, column: 25, scope: !61)
!63 = !DILocation(line: 42, column: 23, scope: !61)
!64 = !DILocation(line: 42, column: 9, scope: !58)
!65 = !DILocation(line: 44, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !12, line: 43, column: 9)
!67 = !DILocation(line: 44, column: 28, scope: !66)
!68 = !DILocation(line: 44, column: 18, scope: !66)
!69 = !DILocation(line: 44, column: 13, scope: !66)
!70 = !DILocation(line: 44, column: 21, scope: !66)
!71 = !DILocation(line: 45, column: 9, scope: !66)
!72 = !DILocation(line: 42, column: 35, scope: !61)
!73 = !DILocation(line: 42, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 45, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 46, column: 9, scope: !42)
!78 = !DILocation(line: 46, column: 21, scope: !42)
!79 = !DILocation(line: 47, column: 20, scope: !42)
!80 = !DILocation(line: 47, column: 9, scope: !42)
!81 = !DILocation(line: 49, column: 1, scope: !11)
!82 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_01_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 86, column: 5, scope: !82)
!84 = !DILocation(line: 87, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !86, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!19, !19, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 99, type: !19)
!92 = !DILocation(line: 99, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 99, type: !88)
!94 = !DILocation(line: 99, column: 27, scope: !85)
!95 = !DILocation(line: 102, column: 22, scope: !85)
!96 = !DILocation(line: 102, column: 12, scope: !85)
!97 = !DILocation(line: 102, column: 5, scope: !85)
!98 = !DILocation(line: 104, column: 5, scope: !85)
!99 = !DILocation(line: 105, column: 5, scope: !85)
!100 = !DILocation(line: 106, column: 5, scope: !85)
!101 = !DILocation(line: 109, column: 5, scope: !85)
!102 = !DILocation(line: 110, column: 5, scope: !85)
!103 = !DILocation(line: 111, column: 5, scope: !85)
!104 = !DILocation(line: 113, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 58, type: !16)
!107 = !DILocation(line: 58, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !12, line: 59, type: !22)
!109 = !DILocation(line: 59, column: 13, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !12, line: 60, type: !27)
!111 = !DILocation(line: 60, column: 13, scope: !105)
!112 = !DILocation(line: 61, column: 13, scope: !105)
!113 = !DILocation(line: 61, column: 5, scope: !105)
!114 = !DILocation(line: 62, column: 5, scope: !105)
!115 = !DILocation(line: 62, column: 25, scope: !105)
!116 = !DILocation(line: 63, column: 13, scope: !105)
!117 = !DILocation(line: 63, column: 5, scope: !105)
!118 = !DILocation(line: 64, column: 5, scope: !105)
!119 = !DILocation(line: 64, column: 27, scope: !105)
!120 = !DILocation(line: 66, column: 12, scope: !105)
!121 = !DILocation(line: 66, column: 10, scope: !105)
!122 = !DILocalVariable(name: "i", scope: !123, file: !12, line: 68, type: !43)
!123 = distinct !DILexicalBlock(scope: !105, file: !12, line: 67, column: 5)
!124 = !DILocation(line: 68, column: 16, scope: !123)
!125 = !DILocalVariable(name: "destLen", scope: !123, file: !12, line: 68, type: !43)
!126 = !DILocation(line: 68, column: 19, scope: !123)
!127 = !DILocalVariable(name: "dest", scope: !123, file: !12, line: 69, type: !27)
!128 = !DILocation(line: 69, column: 17, scope: !123)
!129 = !DILocation(line: 70, column: 17, scope: !123)
!130 = !DILocation(line: 70, column: 9, scope: !123)
!131 = !DILocation(line: 71, column: 9, scope: !123)
!132 = !DILocation(line: 71, column: 21, scope: !123)
!133 = !DILocation(line: 72, column: 26, scope: !123)
!134 = !DILocation(line: 72, column: 19, scope: !123)
!135 = !DILocation(line: 72, column: 17, scope: !123)
!136 = !DILocation(line: 75, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !123, file: !12, line: 75, column: 9)
!138 = !DILocation(line: 75, column: 14, scope: !137)
!139 = !DILocation(line: 75, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 75, column: 9)
!141 = !DILocation(line: 75, column: 25, scope: !140)
!142 = !DILocation(line: 75, column: 23, scope: !140)
!143 = !DILocation(line: 75, column: 9, scope: !137)
!144 = !DILocation(line: 77, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !12, line: 76, column: 9)
!146 = !DILocation(line: 77, column: 28, scope: !145)
!147 = !DILocation(line: 77, column: 18, scope: !145)
!148 = !DILocation(line: 77, column: 13, scope: !145)
!149 = !DILocation(line: 77, column: 21, scope: !145)
!150 = !DILocation(line: 78, column: 9, scope: !145)
!151 = !DILocation(line: 75, column: 35, scope: !140)
!152 = !DILocation(line: 75, column: 9, scope: !140)
!153 = distinct !{!153, !143, !154, !76}
!154 = !DILocation(line: 78, column: 9, scope: !137)
!155 = !DILocation(line: 79, column: 9, scope: !123)
!156 = !DILocation(line: 79, column: 21, scope: !123)
!157 = !DILocation(line: 80, column: 20, scope: !123)
!158 = !DILocation(line: 80, column: 9, scope: !123)
!159 = !DILocation(line: 82, column: 1, scope: !105)
