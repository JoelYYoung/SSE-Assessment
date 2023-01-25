; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @badSource(i32* %0), !dbg !29
  store i32* %call, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !36
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %2) #5, !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  call void @printWLine(i32* %3), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load i32*, i32** %data.addr, align 8, !dbg !48
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #5, !dbg !49
  %1 = load i32*, i32** %data.addr, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %2 = load i32*, i32** %data.addr, align 8, !dbg !52
  ret i32* %2, !dbg !53
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i32* %arraydecay, i32** %data, align 8, !dbg !83
  %0 = load i32*, i32** %data, align 8, !dbg !84
  %call = call i32* @goodG2BSource(i32* %0), !dbg !85
  store i32* %call, i32** %data, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !87, metadata !DIExpression()), !dbg !89
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !89
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !90
  %2 = load i32*, i32** %data, align 8, !dbg !91
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %2) #5, !dbg !92
  %3 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* %3), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !96 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load i32*, i32** %data.addr, align 8, !dbg !99
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #5, !dbg !100
  %1 = load i32*, i32** %data.addr, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %2 = load i32*, i32** %data.addr, align 8, !dbg !103
  ret i32* %2, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 33, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 34, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 34, column: 13, scope: !11)
!26 = !DILocation(line: 35, column: 12, scope: !11)
!27 = !DILocation(line: 35, column: 10, scope: !11)
!28 = !DILocation(line: 36, column: 22, scope: !11)
!29 = !DILocation(line: 36, column: 12, scope: !11)
!30 = !DILocation(line: 36, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !12, line: 38, type: !33)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 38, column: 17, scope: !32)
!37 = !DILocation(line: 40, column: 16, scope: !32)
!38 = !DILocation(line: 40, column: 22, scope: !32)
!39 = !DILocation(line: 40, column: 9, scope: !32)
!40 = !DILocation(line: 41, column: 20, scope: !32)
!41 = !DILocation(line: 41, column: 9, scope: !32)
!42 = !DILocation(line: 43, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 23, type: !44, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!16, !16}
!46 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !12, line: 23, type: !16)
!47 = !DILocation(line: 23, column: 38, scope: !43)
!48 = !DILocation(line: 26, column: 13, scope: !43)
!49 = !DILocation(line: 26, column: 5, scope: !43)
!50 = !DILocation(line: 27, column: 5, scope: !43)
!51 = !DILocation(line: 27, column: 17, scope: !43)
!52 = !DILocation(line: 28, column: 12, scope: !43)
!53 = !DILocation(line: 28, column: 5, scope: !43)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_good", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 74, column: 5, scope: !54)
!56 = !DILocation(line: 75, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !58, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!19, !19, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 87, type: !19)
!64 = !DILocation(line: 87, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 87, type: !60)
!66 = !DILocation(line: 87, column: 27, scope: !57)
!67 = !DILocation(line: 90, column: 22, scope: !57)
!68 = !DILocation(line: 90, column: 12, scope: !57)
!69 = !DILocation(line: 90, column: 5, scope: !57)
!70 = !DILocation(line: 92, column: 5, scope: !57)
!71 = !DILocation(line: 93, column: 5, scope: !57)
!72 = !DILocation(line: 94, column: 5, scope: !57)
!73 = !DILocation(line: 97, column: 5, scope: !57)
!74 = !DILocation(line: 98, column: 5, scope: !57)
!75 = !DILocation(line: 99, column: 5, scope: !57)
!76 = !DILocation(line: 101, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 60, type: !16)
!79 = !DILocation(line: 60, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !12, line: 61, type: !22)
!81 = !DILocation(line: 61, column: 13, scope: !77)
!82 = !DILocation(line: 62, column: 12, scope: !77)
!83 = !DILocation(line: 62, column: 10, scope: !77)
!84 = !DILocation(line: 63, column: 26, scope: !77)
!85 = !DILocation(line: 63, column: 12, scope: !77)
!86 = !DILocation(line: 63, column: 10, scope: !77)
!87 = !DILocalVariable(name: "dest", scope: !88, file: !12, line: 65, type: !33)
!88 = distinct !DILexicalBlock(scope: !77, file: !12, line: 64, column: 5)
!89 = !DILocation(line: 65, column: 17, scope: !88)
!90 = !DILocation(line: 67, column: 16, scope: !88)
!91 = !DILocation(line: 67, column: 22, scope: !88)
!92 = !DILocation(line: 67, column: 9, scope: !88)
!93 = !DILocation(line: 68, column: 20, scope: !88)
!94 = !DILocation(line: 68, column: 9, scope: !88)
!95 = !DILocation(line: 70, column: 1, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 49, type: !44, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", arg: 1, scope: !96, file: !12, line: 49, type: !16)
!98 = !DILocation(line: 49, column: 42, scope: !96)
!99 = !DILocation(line: 52, column: 13, scope: !96)
!100 = !DILocation(line: 52, column: 5, scope: !96)
!101 = !DILocation(line: 53, column: 5, scope: !96)
!102 = !DILocation(line: 53, column: 16, scope: !96)
!103 = !DILocation(line: 54, column: 12, scope: !96)
!104 = !DILocation(line: 54, column: 5, scope: !96)
