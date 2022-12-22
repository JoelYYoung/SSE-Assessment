; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_16_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  br label %while.body, !dbg !27

while.body:                                       ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !30
  %4 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  br label %while.end, !dbg !33

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !40
  %6 = load i32*, i32** %data, align 8, !dbg !41
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !42
  %7 = load i32*, i32** %data, align 8, !dbg !43
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %8), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_16_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #6, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #6, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_16_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_16_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 400, align 16, !dbg !76
  %1 = bitcast i8* %0 to i32*, !dbg !77
  store i32* %1, i32** %dataBuffer, align 8, !dbg !75
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  store i32* %2, i32** %data, align 8, !dbg !79
  br label %while.body, !dbg !80

while.body:                                       ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !81
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !83
  %4 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  br label %while.end, !dbg !86

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !87, metadata !DIExpression()), !dbg !89
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !89
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !90
  %6 = load i32*, i32** %data, align 8, !dbg !91
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !92
  %7 = load i32*, i32** %data, align 8, !dbg !93
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !94
  %8 = load i32*, i32** %data, align 8, !dbg !95
  call void @printWLine(i32* %8), !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_16.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_16_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_16.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 32, type: !4)
!22 = !DILocation(line: 32, column: 15, scope: !15)
!23 = !DILocation(line: 32, column: 39, scope: !15)
!24 = !DILocation(line: 32, column: 28, scope: !15)
!25 = !DILocation(line: 33, column: 12, scope: !15)
!26 = !DILocation(line: 33, column: 10, scope: !15)
!27 = !DILocation(line: 34, column: 5, scope: !15)
!28 = !DILocation(line: 37, column: 17, scope: !29)
!29 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!30 = !DILocation(line: 37, column: 9, scope: !29)
!31 = !DILocation(line: 38, column: 9, scope: !29)
!32 = !DILocation(line: 38, column: 21, scope: !29)
!33 = !DILocation(line: 39, column: 9, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !16, line: 42, type: !36)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 42, column: 17, scope: !35)
!40 = !DILocation(line: 44, column: 18, scope: !35)
!41 = !DILocation(line: 44, column: 31, scope: !35)
!42 = !DILocation(line: 44, column: 24, scope: !35)
!43 = !DILocation(line: 44, column: 45, scope: !35)
!44 = !DILocation(line: 44, column: 9, scope: !35)
!45 = !DILocation(line: 45, column: 20, scope: !35)
!46 = !DILocation(line: 45, column: 9, scope: !35)
!47 = !DILocation(line: 47, column: 1, scope: !15)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_16_good", scope: !16, file: !16, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 76, column: 5, scope: !48)
!50 = !DILocation(line: 77, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 89, type: !52, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!7, !7, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !16, line: 89, type: !7)
!58 = !DILocation(line: 89, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !16, line: 89, type: !54)
!60 = !DILocation(line: 89, column: 27, scope: !51)
!61 = !DILocation(line: 92, column: 22, scope: !51)
!62 = !DILocation(line: 92, column: 12, scope: !51)
!63 = !DILocation(line: 92, column: 5, scope: !51)
!64 = !DILocation(line: 94, column: 5, scope: !51)
!65 = !DILocation(line: 95, column: 5, scope: !51)
!66 = !DILocation(line: 96, column: 5, scope: !51)
!67 = !DILocation(line: 99, column: 5, scope: !51)
!68 = !DILocation(line: 100, column: 5, scope: !51)
!69 = !DILocation(line: 101, column: 5, scope: !51)
!70 = !DILocation(line: 103, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !16, line: 56, type: !4)
!73 = !DILocation(line: 56, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !16, line: 57, type: !4)
!75 = !DILocation(line: 57, column: 15, scope: !71)
!76 = !DILocation(line: 57, column: 39, scope: !71)
!77 = !DILocation(line: 57, column: 28, scope: !71)
!78 = !DILocation(line: 58, column: 12, scope: !71)
!79 = !DILocation(line: 58, column: 10, scope: !71)
!80 = !DILocation(line: 59, column: 5, scope: !71)
!81 = !DILocation(line: 62, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !71, file: !16, line: 60, column: 5)
!83 = !DILocation(line: 62, column: 9, scope: !82)
!84 = !DILocation(line: 63, column: 9, scope: !82)
!85 = !DILocation(line: 63, column: 20, scope: !82)
!86 = !DILocation(line: 64, column: 9, scope: !82)
!87 = !DILocalVariable(name: "dest", scope: !88, file: !16, line: 67, type: !36)
!88 = distinct !DILexicalBlock(scope: !71, file: !16, line: 66, column: 5)
!89 = !DILocation(line: 67, column: 17, scope: !88)
!90 = !DILocation(line: 69, column: 18, scope: !88)
!91 = !DILocation(line: 69, column: 31, scope: !88)
!92 = !DILocation(line: 69, column: 24, scope: !88)
!93 = !DILocation(line: 69, column: 45, scope: !88)
!94 = !DILocation(line: 69, column: 9, scope: !88)
!95 = !DILocation(line: 70, column: 20, scope: !88)
!96 = !DILocation(line: 70, column: 9, scope: !88)
!97 = !DILocation(line: 72, column: 1, scope: !71)
