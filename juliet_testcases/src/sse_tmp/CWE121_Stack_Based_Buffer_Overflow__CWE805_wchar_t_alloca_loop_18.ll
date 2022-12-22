; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_18_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  br label %source, !dbg !29

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !30), !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !41, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !46
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx2, align 4, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %source
  %6 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %6, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 %7, !dbg !59
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !59
  %9 = load i32*, i32** %data, align 8, !dbg !60
  %10 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !60
  store i32 %8, i32* %arrayidx4, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %11, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !69
  store i32 0, i32* %arrayidx5, align 4, !dbg !70
  %13 = load i32*, i32** %data, align 8, !dbg !71
  call void @printWLine(i32* %13), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_18_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #4, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #4, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_18_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_18_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 200, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %2 = alloca i8, i64 400, align 16, !dbg !106
  %3 = bitcast i8* %2 to i32*, !dbg !107
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !105
  br label %source, !dbg !108

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !109), !dbg !110
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !111
  store i32* %4, i32** %data, align 8, !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !120
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !121
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx2, align 4, !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %source
  %6 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %6, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 %7, !dbg !133
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !133
  %9 = load i32*, i32** %data, align 8, !dbg !134
  %10 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !134
  store i32 %8, i32* %arrayidx4, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %11, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !142
  store i32 0, i32* %arrayidx5, align 4, !dbg !143
  %13 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* %13), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_18.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_18_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_18.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 28, column: 5, scope: !15)
!30 = !DILabel(scope: !15, name: "source", file: !16, line: 29)
!31 = !DILocation(line: 29, column: 1, scope: !15)
!32 = !DILocation(line: 32, column: 12, scope: !15)
!33 = !DILocation(line: 32, column: 10, scope: !15)
!34 = !DILocation(line: 33, column: 5, scope: !15)
!35 = !DILocation(line: 33, column: 13, scope: !15)
!36 = !DILocalVariable(name: "i", scope: !37, file: !16, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !39)
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 35, column: 16, scope: !37)
!41 = !DILocalVariable(name: "source", scope: !37, file: !16, line: 36, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 36, column: 17, scope: !37)
!46 = !DILocation(line: 37, column: 17, scope: !37)
!47 = !DILocation(line: 37, column: 9, scope: !37)
!48 = !DILocation(line: 38, column: 9, scope: !37)
!49 = !DILocation(line: 38, column: 23, scope: !37)
!50 = !DILocation(line: 40, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !37, file: !16, line: 40, column: 9)
!52 = !DILocation(line: 40, column: 14, scope: !51)
!53 = !DILocation(line: 40, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !16, line: 40, column: 9)
!55 = !DILocation(line: 40, column: 23, scope: !54)
!56 = !DILocation(line: 40, column: 9, scope: !51)
!57 = !DILocation(line: 42, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !16, line: 41, column: 9)
!59 = !DILocation(line: 42, column: 23, scope: !58)
!60 = !DILocation(line: 42, column: 13, scope: !58)
!61 = !DILocation(line: 42, column: 18, scope: !58)
!62 = !DILocation(line: 42, column: 21, scope: !58)
!63 = !DILocation(line: 43, column: 9, scope: !58)
!64 = !DILocation(line: 40, column: 31, scope: !54)
!65 = !DILocation(line: 40, column: 9, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 43, column: 9, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 44, column: 9, scope: !37)
!70 = !DILocation(line: 44, column: 21, scope: !37)
!71 = !DILocation(line: 45, column: 20, scope: !37)
!72 = !DILocation(line: 45, column: 9, scope: !37)
!73 = !DILocation(line: 47, column: 1, scope: !15)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_18_good", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 81, column: 5, scope: !74)
!76 = !DILocation(line: 82, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 94, type: !78, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7, !7, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !16, line: 94, type: !7)
!84 = !DILocation(line: 94, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !16, line: 94, type: !80)
!86 = !DILocation(line: 94, column: 27, scope: !77)
!87 = !DILocation(line: 97, column: 22, scope: !77)
!88 = !DILocation(line: 97, column: 12, scope: !77)
!89 = !DILocation(line: 97, column: 5, scope: !77)
!90 = !DILocation(line: 99, column: 5, scope: !77)
!91 = !DILocation(line: 100, column: 5, scope: !77)
!92 = !DILocation(line: 101, column: 5, scope: !77)
!93 = !DILocation(line: 104, column: 5, scope: !77)
!94 = !DILocation(line: 105, column: 5, scope: !77)
!95 = !DILocation(line: 106, column: 5, scope: !77)
!96 = !DILocation(line: 108, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !16, line: 56, type: !4)
!99 = !DILocation(line: 56, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !16, line: 57, type: !4)
!101 = !DILocation(line: 57, column: 15, scope: !97)
!102 = !DILocation(line: 57, column: 42, scope: !97)
!103 = !DILocation(line: 57, column: 31, scope: !97)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !16, line: 58, type: !4)
!105 = !DILocation(line: 58, column: 15, scope: !97)
!106 = !DILocation(line: 58, column: 43, scope: !97)
!107 = !DILocation(line: 58, column: 32, scope: !97)
!108 = !DILocation(line: 59, column: 5, scope: !97)
!109 = !DILabel(scope: !97, name: "source", file: !16, line: 60)
!110 = !DILocation(line: 60, column: 1, scope: !97)
!111 = !DILocation(line: 62, column: 12, scope: !97)
!112 = !DILocation(line: 62, column: 10, scope: !97)
!113 = !DILocation(line: 63, column: 5, scope: !97)
!114 = !DILocation(line: 63, column: 13, scope: !97)
!115 = !DILocalVariable(name: "i", scope: !116, file: !16, line: 65, type: !38)
!116 = distinct !DILexicalBlock(scope: !97, file: !16, line: 64, column: 5)
!117 = !DILocation(line: 65, column: 16, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !116, file: !16, line: 66, type: !42)
!119 = !DILocation(line: 66, column: 17, scope: !116)
!120 = !DILocation(line: 67, column: 17, scope: !116)
!121 = !DILocation(line: 67, column: 9, scope: !116)
!122 = !DILocation(line: 68, column: 9, scope: !116)
!123 = !DILocation(line: 68, column: 23, scope: !116)
!124 = !DILocation(line: 70, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !116, file: !16, line: 70, column: 9)
!126 = !DILocation(line: 70, column: 14, scope: !125)
!127 = !DILocation(line: 70, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !16, line: 70, column: 9)
!129 = !DILocation(line: 70, column: 23, scope: !128)
!130 = !DILocation(line: 70, column: 9, scope: !125)
!131 = !DILocation(line: 72, column: 30, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !16, line: 71, column: 9)
!133 = !DILocation(line: 72, column: 23, scope: !132)
!134 = !DILocation(line: 72, column: 13, scope: !132)
!135 = !DILocation(line: 72, column: 18, scope: !132)
!136 = !DILocation(line: 72, column: 21, scope: !132)
!137 = !DILocation(line: 73, column: 9, scope: !132)
!138 = !DILocation(line: 70, column: 31, scope: !128)
!139 = !DILocation(line: 70, column: 9, scope: !128)
!140 = distinct !{!140, !130, !141, !68}
!141 = !DILocation(line: 73, column: 9, scope: !125)
!142 = !DILocation(line: 74, column: 9, scope: !116)
!143 = !DILocation(line: 74, column: 21, scope: !116)
!144 = !DILocation(line: 75, column: 20, scope: !116)
!145 = !DILocation(line: 75, column: 9, scope: !116)
!146 = !DILocation(line: 77, column: 1, scope: !97)
