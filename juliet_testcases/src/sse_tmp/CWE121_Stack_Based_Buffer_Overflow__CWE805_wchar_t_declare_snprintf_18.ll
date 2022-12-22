; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  br label %source, !dbg !31

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !32), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !38, metadata !DIExpression()), !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !41
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !42
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx3, align 4, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !46
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %1, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay4) #4, !dbg !47
  %2 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %2), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_18_good() #0 !dbg !51 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_18_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_18_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
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
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  br label %source, !dbg !81

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !82), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !84
  store i32* %arraydecay, i32** %data, align 8, !dbg !85
  %0 = load i32*, i32** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !88, metadata !DIExpression()), !dbg !90
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !91
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !92
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !93
  store i32 0, i32* %arrayidx3, align 4, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !96
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %1, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay4) #4, !dbg !97
  %2 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* %2), !dbg !99
  ret void, !dbg !100
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_18_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_18.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 32, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 32, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 13, scope: !11)
!31 = !DILocation(line: 34, column: 5, scope: !11)
!32 = !DILabel(scope: !11, name: "source", file: !12, line: 35)
!33 = !DILocation(line: 35, column: 1, scope: !11)
!34 = !DILocation(line: 38, column: 12, scope: !11)
!35 = !DILocation(line: 38, column: 10, scope: !11)
!36 = !DILocation(line: 39, column: 5, scope: !11)
!37 = !DILocation(line: 39, column: 13, scope: !11)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 41, type: !27)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!40 = !DILocation(line: 41, column: 17, scope: !39)
!41 = !DILocation(line: 42, column: 17, scope: !39)
!42 = !DILocation(line: 42, column: 9, scope: !39)
!43 = !DILocation(line: 43, column: 9, scope: !39)
!44 = !DILocation(line: 43, column: 23, scope: !39)
!45 = !DILocation(line: 45, column: 18, scope: !39)
!46 = !DILocation(line: 45, column: 36, scope: !39)
!47 = !DILocation(line: 45, column: 9, scope: !39)
!48 = !DILocation(line: 46, column: 20, scope: !39)
!49 = !DILocation(line: 46, column: 9, scope: !39)
!50 = !DILocation(line: 48, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_18_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 77, column: 5, scope: !51)
!53 = !DILocation(line: 78, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !55, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!19, !19, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 90, type: !19)
!61 = !DILocation(line: 90, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 90, type: !57)
!63 = !DILocation(line: 90, column: 27, scope: !54)
!64 = !DILocation(line: 93, column: 22, scope: !54)
!65 = !DILocation(line: 93, column: 12, scope: !54)
!66 = !DILocation(line: 93, column: 5, scope: !54)
!67 = !DILocation(line: 95, column: 5, scope: !54)
!68 = !DILocation(line: 96, column: 5, scope: !54)
!69 = !DILocation(line: 97, column: 5, scope: !54)
!70 = !DILocation(line: 100, column: 5, scope: !54)
!71 = !DILocation(line: 101, column: 5, scope: !54)
!72 = !DILocation(line: 102, column: 5, scope: !54)
!73 = !DILocation(line: 104, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 57, type: !16)
!76 = !DILocation(line: 57, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !12, line: 58, type: !22)
!78 = !DILocation(line: 58, column: 13, scope: !74)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !12, line: 59, type: !27)
!80 = !DILocation(line: 59, column: 13, scope: !74)
!81 = !DILocation(line: 60, column: 5, scope: !74)
!82 = !DILabel(scope: !74, name: "source", file: !12, line: 61)
!83 = !DILocation(line: 61, column: 1, scope: !74)
!84 = !DILocation(line: 63, column: 12, scope: !74)
!85 = !DILocation(line: 63, column: 10, scope: !74)
!86 = !DILocation(line: 64, column: 5, scope: !74)
!87 = !DILocation(line: 64, column: 13, scope: !74)
!88 = !DILocalVariable(name: "source", scope: !89, file: !12, line: 66, type: !27)
!89 = distinct !DILexicalBlock(scope: !74, file: !12, line: 65, column: 5)
!90 = !DILocation(line: 66, column: 17, scope: !89)
!91 = !DILocation(line: 67, column: 17, scope: !89)
!92 = !DILocation(line: 67, column: 9, scope: !89)
!93 = !DILocation(line: 68, column: 9, scope: !89)
!94 = !DILocation(line: 68, column: 23, scope: !89)
!95 = !DILocation(line: 70, column: 18, scope: !89)
!96 = !DILocation(line: 70, column: 36, scope: !89)
!97 = !DILocation(line: 70, column: 9, scope: !89)
!98 = !DILocation(line: 71, column: 20, scope: !89)
!99 = !DILocation(line: 71, column: 9, scope: !89)
!100 = !DILocation(line: 73, column: 1, scope: !74)
