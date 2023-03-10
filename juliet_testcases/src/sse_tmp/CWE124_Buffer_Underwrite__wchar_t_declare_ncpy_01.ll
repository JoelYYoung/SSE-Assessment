; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_01.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !31
  store i32* %add.ptr, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !36
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !37
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !38
  store i32 0, i32* %arrayidx4, align 4, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %call6 = call i32* @wcsncpy(i32* %0, i32* %arraydecay5, i64 99) #4, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx7 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !43
  store i32 0, i32* %arrayidx7, align 4, !dbg !44
  %2 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %2), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_01_good() #0 !dbg !48 {
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
  %call = call i64 @time(i64* null) #4, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #4, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_01_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_01_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !76
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !77
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !80
  store i32* %arraydecay1, i32** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !85
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !86
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx4, align 4, !dbg !88
  %0 = load i32*, i32** %data, align 8, !dbg !89
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !90
  %call6 = call i32* @wcsncpy(i32* %0, i32* %arraydecay5, i64 99) #4, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx7 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !92
  store i32 0, i32* %arrayidx7, align 4, !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  call void @printWLine(i32* %2), !dbg !95
  ret void, !dbg !96
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 30, column: 12, scope: !11)
!31 = !DILocation(line: 30, column: 23, scope: !11)
!32 = !DILocation(line: 30, column: 10, scope: !11)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 32, type: !22)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!35 = !DILocation(line: 32, column: 17, scope: !34)
!36 = !DILocation(line: 33, column: 17, scope: !34)
!37 = !DILocation(line: 33, column: 9, scope: !34)
!38 = !DILocation(line: 34, column: 9, scope: !34)
!39 = !DILocation(line: 34, column: 23, scope: !34)
!40 = !DILocation(line: 36, column: 17, scope: !34)
!41 = !DILocation(line: 36, column: 23, scope: !34)
!42 = !DILocation(line: 36, column: 9, scope: !34)
!43 = !DILocation(line: 38, column: 9, scope: !34)
!44 = !DILocation(line: 38, column: 21, scope: !34)
!45 = !DILocation(line: 39, column: 20, scope: !34)
!46 = !DILocation(line: 39, column: 9, scope: !34)
!47 = !DILocation(line: 41, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_01_good", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 70, column: 5, scope: !48)
!50 = !DILocation(line: 71, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !52, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!19, !19, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 83, type: !19)
!58 = !DILocation(line: 83, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 83, type: !54)
!60 = !DILocation(line: 83, column: 27, scope: !51)
!61 = !DILocation(line: 86, column: 22, scope: !51)
!62 = !DILocation(line: 86, column: 12, scope: !51)
!63 = !DILocation(line: 86, column: 5, scope: !51)
!64 = !DILocation(line: 88, column: 5, scope: !51)
!65 = !DILocation(line: 89, column: 5, scope: !51)
!66 = !DILocation(line: 90, column: 5, scope: !51)
!67 = !DILocation(line: 93, column: 5, scope: !51)
!68 = !DILocation(line: 94, column: 5, scope: !51)
!69 = !DILocation(line: 95, column: 5, scope: !51)
!70 = !DILocation(line: 97, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 50, type: !16)
!73 = !DILocation(line: 50, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !12, line: 51, type: !22)
!75 = !DILocation(line: 51, column: 13, scope: !71)
!76 = !DILocation(line: 52, column: 13, scope: !71)
!77 = !DILocation(line: 52, column: 5, scope: !71)
!78 = !DILocation(line: 53, column: 5, scope: !71)
!79 = !DILocation(line: 53, column: 23, scope: !71)
!80 = !DILocation(line: 55, column: 12, scope: !71)
!81 = !DILocation(line: 55, column: 10, scope: !71)
!82 = !DILocalVariable(name: "source", scope: !83, file: !12, line: 57, type: !22)
!83 = distinct !DILexicalBlock(scope: !71, file: !12, line: 56, column: 5)
!84 = !DILocation(line: 57, column: 17, scope: !83)
!85 = !DILocation(line: 58, column: 17, scope: !83)
!86 = !DILocation(line: 58, column: 9, scope: !83)
!87 = !DILocation(line: 59, column: 9, scope: !83)
!88 = !DILocation(line: 59, column: 23, scope: !83)
!89 = !DILocation(line: 61, column: 17, scope: !83)
!90 = !DILocation(line: 61, column: 23, scope: !83)
!91 = !DILocation(line: 61, column: 9, scope: !83)
!92 = !DILocation(line: 63, column: 9, scope: !83)
!93 = !DILocation(line: 63, column: 21, scope: !83)
!94 = !DILocation(line: 64, column: 20, scope: !83)
!95 = !DILocation(line: 64, column: 9, scope: !83)
!96 = !DILocation(line: 66, column: 1, scope: !71)
