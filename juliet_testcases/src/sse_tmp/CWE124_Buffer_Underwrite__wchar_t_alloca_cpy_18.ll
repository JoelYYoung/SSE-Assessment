; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_18.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_18_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  br label %source, !dbg !29

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !30), !dbg !31
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !33
  store i32* %add.ptr, i32** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !41
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !42
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx3, align 4, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !46
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #4, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %6), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_18_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #4, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #4, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_18_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_18_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 400, align 16, !dbg !79
  %1 = bitcast i8* %0 to i32*, !dbg !80
  store i32* %1, i32** %dataBuffer, align 8, !dbg !78
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !81
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !82
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  br label %source, !dbg !85

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !86), !dbg !87
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  store i32* %4, i32** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !93
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !94
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx3, align 4, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !98
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #4, !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %6), !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_18_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 29, column: 5, scope: !15)
!30 = !DILabel(scope: !15, name: "source", file: !16, line: 30)
!31 = !DILocation(line: 30, column: 1, scope: !15)
!32 = !DILocation(line: 32, column: 12, scope: !15)
!33 = !DILocation(line: 32, column: 23, scope: !15)
!34 = !DILocation(line: 32, column: 10, scope: !15)
!35 = !DILocalVariable(name: "source", scope: !36, file: !16, line: 34, type: !37)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 34, column: 17, scope: !36)
!41 = !DILocation(line: 35, column: 17, scope: !36)
!42 = !DILocation(line: 35, column: 9, scope: !36)
!43 = !DILocation(line: 36, column: 9, scope: !36)
!44 = !DILocation(line: 36, column: 23, scope: !36)
!45 = !DILocation(line: 38, column: 16, scope: !36)
!46 = !DILocation(line: 38, column: 22, scope: !36)
!47 = !DILocation(line: 38, column: 9, scope: !36)
!48 = !DILocation(line: 39, column: 20, scope: !36)
!49 = !DILocation(line: 39, column: 9, scope: !36)
!50 = !DILocation(line: 41, column: 1, scope: !15)
!51 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_18_good", scope: !16, file: !16, line: 68, type: !17, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 70, column: 5, scope: !51)
!53 = !DILocation(line: 71, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 83, type: !55, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !16, line: 83, type: !7)
!61 = !DILocation(line: 83, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !16, line: 83, type: !57)
!63 = !DILocation(line: 83, column: 27, scope: !54)
!64 = !DILocation(line: 86, column: 22, scope: !54)
!65 = !DILocation(line: 86, column: 12, scope: !54)
!66 = !DILocation(line: 86, column: 5, scope: !54)
!67 = !DILocation(line: 88, column: 5, scope: !54)
!68 = !DILocation(line: 89, column: 5, scope: !54)
!69 = !DILocation(line: 90, column: 5, scope: !54)
!70 = !DILocation(line: 93, column: 5, scope: !54)
!71 = !DILocation(line: 94, column: 5, scope: !54)
!72 = !DILocation(line: 95, column: 5, scope: !54)
!73 = !DILocation(line: 97, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !16, line: 50, type: !4)
!76 = !DILocation(line: 50, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !16, line: 51, type: !4)
!78 = !DILocation(line: 51, column: 15, scope: !74)
!79 = !DILocation(line: 51, column: 39, scope: !74)
!80 = !DILocation(line: 51, column: 28, scope: !74)
!81 = !DILocation(line: 52, column: 13, scope: !74)
!82 = !DILocation(line: 52, column: 5, scope: !74)
!83 = !DILocation(line: 53, column: 5, scope: !74)
!84 = !DILocation(line: 53, column: 23, scope: !74)
!85 = !DILocation(line: 54, column: 5, scope: !74)
!86 = !DILabel(scope: !74, name: "source", file: !16, line: 55)
!87 = !DILocation(line: 55, column: 1, scope: !74)
!88 = !DILocation(line: 57, column: 12, scope: !74)
!89 = !DILocation(line: 57, column: 10, scope: !74)
!90 = !DILocalVariable(name: "source", scope: !91, file: !16, line: 59, type: !37)
!91 = distinct !DILexicalBlock(scope: !74, file: !16, line: 58, column: 5)
!92 = !DILocation(line: 59, column: 17, scope: !91)
!93 = !DILocation(line: 60, column: 17, scope: !91)
!94 = !DILocation(line: 60, column: 9, scope: !91)
!95 = !DILocation(line: 61, column: 9, scope: !91)
!96 = !DILocation(line: 61, column: 23, scope: !91)
!97 = !DILocation(line: 63, column: 16, scope: !91)
!98 = !DILocation(line: 63, column: 22, scope: !91)
!99 = !DILocation(line: 63, column: 9, scope: !91)
!100 = !DILocation(line: 64, column: 20, scope: !91)
!101 = !DILocation(line: 64, column: 9, scope: !91)
!102 = !DILocation(line: 66, column: 1, scope: !74)
