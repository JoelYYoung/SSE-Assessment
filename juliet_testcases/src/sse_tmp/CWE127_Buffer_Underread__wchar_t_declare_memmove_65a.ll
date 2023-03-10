; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memmove_65a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memmove_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_memmove_65_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @CWE127_Buffer_Underread__wchar_t_declare_memmove_65b_badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !35
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !36
  store i32* %add.ptr, i32** %data, align 8, !dbg !37
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !38
  %1 = load i32*, i32** %data, align 8, !dbg !39
  call void %0(i32* %1), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE127_Buffer_Underread__wchar_t_declare_memmove_65b_badSink(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_memmove_65_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #4, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #4, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE127_Buffer_Underread__wchar_t_declare_memmove_65_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE127_Buffer_Underread__wchar_t_declare_memmove_65_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !67, metadata !DIExpression()), !dbg !68
  store void (i32*)* @CWE127_Buffer_Underread__wchar_t_declare_memmove_65b_goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !71
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !72
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !75
  store i32* %arraydecay1, i32** %data, align 8, !dbg !76
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !77
  %1 = load i32*, i32** %data, align 8, !dbg !78
  call void %0(i32* %1), !dbg !77
  ret void, !dbg !79
}

declare dso_local void @CWE127_Buffer_Underread__wchar_t_declare_memmove_65b_goodG2BSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memmove_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_memmove_65_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_memmove_65a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !11)
!21 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 30, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !16}
!25 = !DILocation(line: 30, column: 12, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 31, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 31, column: 13, scope: !11)
!31 = !DILocation(line: 32, column: 13, scope: !11)
!32 = !DILocation(line: 32, column: 5, scope: !11)
!33 = !DILocation(line: 33, column: 5, scope: !11)
!34 = !DILocation(line: 33, column: 23, scope: !11)
!35 = !DILocation(line: 35, column: 12, scope: !11)
!36 = !DILocation(line: 35, column: 23, scope: !11)
!37 = !DILocation(line: 35, column: 10, scope: !11)
!38 = !DILocation(line: 37, column: 5, scope: !11)
!39 = !DILocation(line: 37, column: 13, scope: !11)
!40 = !DILocation(line: 38, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_memmove_65_good", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 61, column: 5, scope: !41)
!43 = !DILocation(line: 62, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 74, type: !45, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!19, !19, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 74, type: !19)
!51 = !DILocation(line: 74, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 74, type: !47)
!53 = !DILocation(line: 74, column: 27, scope: !44)
!54 = !DILocation(line: 77, column: 22, scope: !44)
!55 = !DILocation(line: 77, column: 12, scope: !44)
!56 = !DILocation(line: 77, column: 5, scope: !44)
!57 = !DILocation(line: 79, column: 5, scope: !44)
!58 = !DILocation(line: 80, column: 5, scope: !44)
!59 = !DILocation(line: 81, column: 5, scope: !44)
!60 = !DILocation(line: 84, column: 5, scope: !44)
!61 = !DILocation(line: 85, column: 5, scope: !44)
!62 = !DILocation(line: 86, column: 5, scope: !44)
!63 = !DILocation(line: 88, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !12, line: 49, type: !16)
!66 = !DILocation(line: 49, column: 15, scope: !64)
!67 = !DILocalVariable(name: "funcPtr", scope: !64, file: !12, line: 50, type: !22)
!68 = !DILocation(line: 50, column: 12, scope: !64)
!69 = !DILocalVariable(name: "dataBuffer", scope: !64, file: !12, line: 51, type: !27)
!70 = !DILocation(line: 51, column: 13, scope: !64)
!71 = !DILocation(line: 52, column: 13, scope: !64)
!72 = !DILocation(line: 52, column: 5, scope: !64)
!73 = !DILocation(line: 53, column: 5, scope: !64)
!74 = !DILocation(line: 53, column: 23, scope: !64)
!75 = !DILocation(line: 55, column: 12, scope: !64)
!76 = !DILocation(line: 55, column: 10, scope: !64)
!77 = !DILocation(line: 56, column: 5, scope: !64)
!78 = !DILocation(line: 56, column: 13, scope: !64)
!79 = !DILocation(line: 57, column: 1, scope: !64)
