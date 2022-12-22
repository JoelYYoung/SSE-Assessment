; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !38
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !39
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call4 = call i32* @wcsncpy(i32* %1, i32* %arraydecay3, i64 99) #4, !dbg !44
  %2 = load i32*, i32** %data, align 8, !dbg !45
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !45
  store i32 0, i32* %arrayidx5, align 4, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %3), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_01_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #4, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #4, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_01_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_01_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !80
  store i32* %arraydecay, i32** %data, align 8, !dbg !81
  %0 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !87
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !88
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx2, align 4, !dbg !90
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !92
  %call4 = call i32* @wcsncpy(i32* %1, i32* %arraydecay3, i64 99) #4, !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !94
  store i32 0, i32* %arrayidx5, align 4, !dbg !95
  %3 = load i32*, i32** %data, align 8, !dbg !96
  call void @printWLine(i32* %3), !dbg !97
  ret void, !dbg !98
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_01.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
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
!31 = !DILocation(line: 30, column: 12, scope: !11)
!32 = !DILocation(line: 30, column: 10, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 13, scope: !11)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 33, type: !27)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!37 = !DILocation(line: 33, column: 17, scope: !36)
!38 = !DILocation(line: 34, column: 17, scope: !36)
!39 = !DILocation(line: 34, column: 9, scope: !36)
!40 = !DILocation(line: 35, column: 9, scope: !36)
!41 = !DILocation(line: 35, column: 23, scope: !36)
!42 = !DILocation(line: 37, column: 17, scope: !36)
!43 = !DILocation(line: 37, column: 23, scope: !36)
!44 = !DILocation(line: 37, column: 9, scope: !36)
!45 = !DILocation(line: 38, column: 9, scope: !36)
!46 = !DILocation(line: 38, column: 21, scope: !36)
!47 = !DILocation(line: 39, column: 20, scope: !36)
!48 = !DILocation(line: 39, column: 9, scope: !36)
!49 = !DILocation(line: 41, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_01_good", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 69, column: 5, scope: !50)
!52 = !DILocation(line: 70, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !54, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!19, !19, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 82, type: !19)
!60 = !DILocation(line: 82, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 82, type: !56)
!62 = !DILocation(line: 82, column: 27, scope: !53)
!63 = !DILocation(line: 85, column: 22, scope: !53)
!64 = !DILocation(line: 85, column: 12, scope: !53)
!65 = !DILocation(line: 85, column: 5, scope: !53)
!66 = !DILocation(line: 87, column: 5, scope: !53)
!67 = !DILocation(line: 88, column: 5, scope: !53)
!68 = !DILocation(line: 89, column: 5, scope: !53)
!69 = !DILocation(line: 92, column: 5, scope: !53)
!70 = !DILocation(line: 93, column: 5, scope: !53)
!71 = !DILocation(line: 94, column: 5, scope: !53)
!72 = !DILocation(line: 96, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 50, type: !16)
!75 = !DILocation(line: 50, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !12, line: 51, type: !22)
!77 = !DILocation(line: 51, column: 13, scope: !73)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !12, line: 52, type: !27)
!79 = !DILocation(line: 52, column: 13, scope: !73)
!80 = !DILocation(line: 54, column: 12, scope: !73)
!81 = !DILocation(line: 54, column: 10, scope: !73)
!82 = !DILocation(line: 55, column: 5, scope: !73)
!83 = !DILocation(line: 55, column: 13, scope: !73)
!84 = !DILocalVariable(name: "source", scope: !85, file: !12, line: 57, type: !27)
!85 = distinct !DILexicalBlock(scope: !73, file: !12, line: 56, column: 5)
!86 = !DILocation(line: 57, column: 17, scope: !85)
!87 = !DILocation(line: 58, column: 17, scope: !85)
!88 = !DILocation(line: 58, column: 9, scope: !85)
!89 = !DILocation(line: 59, column: 9, scope: !85)
!90 = !DILocation(line: 59, column: 23, scope: !85)
!91 = !DILocation(line: 61, column: 17, scope: !85)
!92 = !DILocation(line: 61, column: 23, scope: !85)
!93 = !DILocation(line: 61, column: 9, scope: !85)
!94 = !DILocation(line: 62, column: 9, scope: !85)
!95 = !DILocation(line: 62, column: 21, scope: !85)
!96 = !DILocation(line: 63, column: 20, scope: !85)
!97 = !DILocation(line: 63, column: 9, scope: !85)
!98 = !DILocation(line: 65, column: 1, scope: !73)
