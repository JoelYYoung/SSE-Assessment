; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_16.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_16_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  br label %while.body, !dbg !15

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !32
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !35
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !35
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !35
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  call void @printWLine(i32* %arraydecay3), !dbg !37
  br label %while.end, !dbg !38

while.end:                                        ; preds = %while.body
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_16_good() #0 !dbg !40 {
entry:
  call void @good1(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #5, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #5, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_16_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_16_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !63 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  br label %while.body, !dbg !64

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !65, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !69, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !71
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !72
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !75
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !75
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !75
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !76
  store i32 0, i32* %arrayidx3, align 4, !dbg !77
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !78
  call void @printWLine(i32* %arraydecay4), !dbg !79
  br label %while.end, !dbg !80

while.end:                                        ; preds = %while.body
  ret void, !dbg !81
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_16_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_16.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 5, scope: !11)
!16 = !DILocalVariable(name: "data", scope: !17, file: !12, line: 27, type: !19)
!17 = distinct !DILexicalBlock(scope: !18, file: !12, line: 26, column: 9)
!18 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 4800, elements: !23)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !22)
!21 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !{!24}
!24 = !DISubrange(count: 150)
!25 = !DILocation(line: 27, column: 21, scope: !17)
!26 = !DILocalVariable(name: "dest", scope: !17, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 32, scope: !17)
!31 = !DILocation(line: 29, column: 21, scope: !17)
!32 = !DILocation(line: 29, column: 13, scope: !17)
!33 = !DILocation(line: 30, column: 13, scope: !17)
!34 = !DILocation(line: 30, column: 23, scope: !17)
!35 = !DILocation(line: 31, column: 13, scope: !17)
!36 = !DILocation(line: 33, column: 24, scope: !17)
!37 = !DILocation(line: 33, column: 13, scope: !17)
!38 = !DILocation(line: 35, column: 9, scope: !18)
!39 = !DILocation(line: 37, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_16_good", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 63, column: 5, scope: !40)
!42 = !DILocation(line: 64, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 75, type: !44, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!22, !22, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !12, line: 75, type: !22)
!50 = !DILocation(line: 75, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !12, line: 75, type: !46)
!52 = !DILocation(line: 75, column: 27, scope: !43)
!53 = !DILocation(line: 78, column: 22, scope: !43)
!54 = !DILocation(line: 78, column: 12, scope: !43)
!55 = !DILocation(line: 78, column: 5, scope: !43)
!56 = !DILocation(line: 80, column: 5, scope: !43)
!57 = !DILocation(line: 81, column: 5, scope: !43)
!58 = !DILocation(line: 82, column: 5, scope: !43)
!59 = !DILocation(line: 85, column: 5, scope: !43)
!60 = !DILocation(line: 86, column: 5, scope: !43)
!61 = !DILocation(line: 87, column: 5, scope: !43)
!62 = !DILocation(line: 89, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 44, type: !13, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 46, column: 5, scope: !63)
!65 = !DILocalVariable(name: "data", scope: !66, file: !12, line: 49, type: !19)
!66 = distinct !DILexicalBlock(scope: !67, file: !12, line: 48, column: 9)
!67 = distinct !DILexicalBlock(scope: !63, file: !12, line: 47, column: 5)
!68 = !DILocation(line: 49, column: 21, scope: !66)
!69 = !DILocalVariable(name: "dest", scope: !66, file: !12, line: 49, type: !27)
!70 = !DILocation(line: 49, column: 32, scope: !66)
!71 = !DILocation(line: 51, column: 21, scope: !66)
!72 = !DILocation(line: 51, column: 13, scope: !66)
!73 = !DILocation(line: 52, column: 13, scope: !66)
!74 = !DILocation(line: 52, column: 23, scope: !66)
!75 = !DILocation(line: 53, column: 13, scope: !66)
!76 = !DILocation(line: 54, column: 13, scope: !66)
!77 = !DILocation(line: 54, column: 22, scope: !66)
!78 = !DILocation(line: 55, column: 24, scope: !66)
!79 = !DILocation(line: 55, column: 13, scope: !66)
!80 = !DILocation(line: 57, column: 9, scope: !67)
!81 = !DILocation(line: 59, column: 1, scope: !63)
