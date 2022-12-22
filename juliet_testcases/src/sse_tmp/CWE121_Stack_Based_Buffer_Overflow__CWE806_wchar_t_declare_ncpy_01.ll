; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !37
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %4 = load i32*, i32** %data, align 8, !dbg !40
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !41
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %3, i64 %call2) #6, !dbg !42
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !43
  store i32 0, i32* %arrayidx4, align 4, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %5), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_01_good() #0 !dbg !48 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_01_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_01_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
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
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !76
  store i32* %arraydecay, i32** %data, align 8, !dbg !77
  %0 = load i32*, i32** %data, align 8, !dbg !78
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !79
  %1 = load i32*, i32** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !84
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !85
  %3 = load i32*, i32** %data, align 8, !dbg !86
  %4 = load i32*, i32** %data, align 8, !dbg !87
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !88
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %3, i64 %call2) #6, !dbg !89
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !90
  store i32 0, i32* %arrayidx4, align 4, !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !92
  call void @printWLine(i32* %5), !dbg !93
  ret void, !dbg !94
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_01.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 12, scope: !11)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 29, column: 13, scope: !11)
!29 = !DILocation(line: 29, column: 5, scope: !11)
!30 = !DILocation(line: 30, column: 5, scope: !11)
!31 = !DILocation(line: 30, column: 17, scope: !11)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !12, line: 32, type: !34)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 32, column: 17, scope: !33)
!38 = !DILocation(line: 34, column: 17, scope: !33)
!39 = !DILocation(line: 34, column: 23, scope: !33)
!40 = !DILocation(line: 34, column: 36, scope: !33)
!41 = !DILocation(line: 34, column: 29, scope: !33)
!42 = !DILocation(line: 34, column: 9, scope: !33)
!43 = !DILocation(line: 35, column: 9, scope: !33)
!44 = !DILocation(line: 35, column: 20, scope: !33)
!45 = !DILocation(line: 36, column: 20, scope: !33)
!46 = !DILocation(line: 36, column: 9, scope: !33)
!47 = !DILocation(line: 38, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_01_good", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 64, column: 5, scope: !48)
!50 = !DILocation(line: 65, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 77, type: !52, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!19, !19, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 77, type: !19)
!58 = !DILocation(line: 77, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 77, type: !54)
!60 = !DILocation(line: 77, column: 27, scope: !51)
!61 = !DILocation(line: 80, column: 22, scope: !51)
!62 = !DILocation(line: 80, column: 12, scope: !51)
!63 = !DILocation(line: 80, column: 5, scope: !51)
!64 = !DILocation(line: 82, column: 5, scope: !51)
!65 = !DILocation(line: 83, column: 5, scope: !51)
!66 = !DILocation(line: 84, column: 5, scope: !51)
!67 = !DILocation(line: 87, column: 5, scope: !51)
!68 = !DILocation(line: 88, column: 5, scope: !51)
!69 = !DILocation(line: 89, column: 5, scope: !51)
!70 = !DILocation(line: 91, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 47, type: !16)
!73 = !DILocation(line: 47, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !12, line: 48, type: !22)
!75 = !DILocation(line: 48, column: 13, scope: !71)
!76 = !DILocation(line: 49, column: 12, scope: !71)
!77 = !DILocation(line: 49, column: 10, scope: !71)
!78 = !DILocation(line: 51, column: 13, scope: !71)
!79 = !DILocation(line: 51, column: 5, scope: !71)
!80 = !DILocation(line: 52, column: 5, scope: !71)
!81 = !DILocation(line: 52, column: 16, scope: !71)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !12, line: 54, type: !34)
!83 = distinct !DILexicalBlock(scope: !71, file: !12, line: 53, column: 5)
!84 = !DILocation(line: 54, column: 17, scope: !83)
!85 = !DILocation(line: 56, column: 17, scope: !83)
!86 = !DILocation(line: 56, column: 23, scope: !83)
!87 = !DILocation(line: 56, column: 36, scope: !83)
!88 = !DILocation(line: 56, column: 29, scope: !83)
!89 = !DILocation(line: 56, column: 9, scope: !83)
!90 = !DILocation(line: 57, column: 9, scope: !83)
!91 = !DILocation(line: 57, column: 20, scope: !83)
!92 = !DILocation(line: 58, column: 20, scope: !83)
!93 = !DILocation(line: 58, column: 9, scope: !83)
!94 = !DILocation(line: 60, column: 1, scope: !71)
